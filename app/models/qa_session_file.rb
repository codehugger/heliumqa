class QaSessionFile < ApplicationRecord
  include Keyable
  include DICOM
  include QaSessionFileUploader::Attachment.new(:file)

  DICOM_SERIES_ID_TAG = '0020,000E'
  DICOM_SERIES_NUMBER_TAG = '0020,0011'
  DICOM_MODALITY_TAG = '0008,0060'
  DICOM_SERIES_DESCRIPTION_TAG = '0008,103E'
  DICOM_ACQUISITION_DATE = '0008,0022'

  # Relationships
  belongs_to :qa_session
  belongs_to :scan_protocol, optional: true
  belongs_to :scan_series, optional: true
  has_one :preview, class_name: 'QaSessionFilePreview', dependent: :destroy

  # Delegations
  delegate :url, to: :file

  # Validations
  validates :file, presence: true
  # validates :filename, uniqueness: { scope: :scan_series_id }

  # Scopes
  scope :unmatched, ->{ where(scan_protocol: nil) }
  scope :grouped_by_protocol, -> { includes(:scan_protocol).group_by(&:scan_protocol) }
  scope :grouped_by_scan_series, -> { includes(:scan_series).group_by(&:scan_series) }
  # TODO: needs to be improved to sort both ASC and DESC
  scope :order_alphanumeric, ->(field) { reorder("SUBSTRING(#{field.to_s} FROM '^(.*?)(\\d+)?$'),
    COALESCE(SUBSTRING(#{field.to_s} FROM '(\\d+)$')::INTEGER, 0);") }

  default_scope -> { order(filename: :asc) }

  # Hooks
  before_save :extract_file_attributes
  before_save :extract_scan_header
  before_save :extract_scan_attributes
  before_save :match_scan_protocol
  after_save :generate_preview

  def extract_file_attributes
    if file_attacher.stored?
      self.mime_type = file.mime_type
      self.filename = file.original_filename
    end
  end

  def extract_file_attributes!
    extract_file_attributes
    save!
  end

  def extract_scan_attributes
    if !scan_header_extracted.blank? && file_attacher.stored?
      if scan_header.key?(DICOM_SERIES_ID_TAG)
        # This utilizes Postgres UPSERT to ensure thread safety
        self.scan_series = ScanSeries.upsert(uid: scan_header[DICOM_SERIES_ID_TAG],
                                             number: scan_header[DICOM_SERIES_NUMBER_TAG],
                                             description: scan_header[DICOM_SERIES_DESCRIPTION_TAG],
                                             qa_session_id: qa_session.id,
                                             equipment_id: qa_session.try(:account).try(:equipment).try(:first))
        self.scan_series = ScanSeries.find_by(uid: scan_header[DICOM_SERIES_ID_TAG]) unless self.scan_series
      end
      self.modality = scan_header.fetch(DICOM_MODALITY_TAG, '')
      self.scan_acquisition_date = scan_header.fetch(DICOM_ACQUISITION_DATE, '')
      self.scan_attributes_extracted = Time.now
    end
  end

  def extract_scan_attributes!
    extract_scan_attributes
    save!
  end

  def extract_scan_header(force=false)
    if (file_data_changed? || force) && file_attacher.stored?
      file.download.tap do |tempfile|
        dcm = DObject.read(tempfile.path)
        self.scan_header = dcm.try(:tags) || {}
        self.scan_header_extracted = Time.now
      end
    end
  end

  def generate_preview(force=false)
    if (file_data_changed? || force) && file_attacher.stored?
      case file.mime_type
      when 'application/dicom'
        file.download.tap do |tempfile|
          dicom_preview = Tempfile.new(['dicom_preview', '.png'], binmode: true)
          DICOM.image_processor = :mini_magick
          dcm = DObject.read(tempfile.path)
          dcm.image.normalize.write(dicom_preview.path)
          create_preview(file: dicom_preview)
        end
      end
      touch(:preview_generated)
    end
  end

  def match_scan_protocol(force=false)
    if (file_data_changed? || force) && file_attacher.stored?
      qa_session.account.scan_protocols.matching(scan_header).most_specific.first.tap do |protocol|
        self.scan_protocol = protocol
        self.scan_protocol_matched = Time.now
      end
    end
  end

  def matcher_headers
    tag_keys = ScanHeaderTag.all.collect(&:key)
    scan_header.keep_if { |k, v| tag_keys.include?(k) }
  end

  def matchers
    matcher_headers.each.map { |k, v| ScanProtocolMatcher.from_tag(k, v) }.compact
  end
end
