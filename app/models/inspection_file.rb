class InspectionFile < ApplicationRecord
  include DICOM
  include InspectionFileUploader::Attachment.new(:file)

  # Relationships
  belongs_to :inspection
  belongs_to :equipment_profile, optional: true

  # Validations
  validates :file, presence: true

  # Scopes
  scope :unprofiled, ->{ where(equipment_profile: nil) }
  scope :grouped_by_profile, -> { includes(:equipment_profile).group_by(&:equipment_profile) }

  # Hooks
  before_save :match_profile

  def to_s
    original_filename
  end

  def stored?
    file_attacher.stored?
  end

  def probed?
    !probed_at.blank?
  end

  def profiled?
    !profiled_at.blank?
  end

  def original_filename
    return file[:original].original_filename if stored?
    file.original_filename
  end

  def original_url
    return file[:original].url if stored?
  end

  def modality
    return nil if file[:original].mime_type != "application/dicom"
    self.profile_header["0008,0060"]
  end

  def extract_header(force=false)
    return if probed? && !force
    return unless stored?

    case file[:original].mime_type
    when "application/dicom"
      # Download file from S3
      tempfile = file[:original].download
      # Try to extract DICOM tags
      self.profile_header = DObject.read(tempfile.path).try(:tags) || {}
    else
      self.profile_header = {}
    end

    # Track when the header was extracted
    self.probed_at = Time.now

    # Make sure we don't leave any garbage after we are done
    tempfile.try(:delete)
  end

  def match_profile(force=false)
    return if profiled? && !force
    return unless stored?

    # Make sure we have a header to work with
    extract_header(force)

    self.equipment_profile = EquipmentProfile.matching(profile_header).first
    self.profiled_at = Time.now
  end
end
