class ScanSeries < ApplicationRecord
  upsert_keys [:uid]

  # Relationships
  belongs_to :qa_session
  belongs_to :equipment, optional: true
  has_many :qa_session_files, dependent: :destroy
  has_many :analysis_requests, dependent: :destroy
  has_many :analysis_responses, through: :analysis_requests

  # Hooks
  before_validation :assign_equipment

  # Validations
  validates :uid, presence: true, uniqueness: true

  alias files qa_session_files
  alias machine equipment

  def method_missing(method, *args)
    return qa_session_files.first.send(method, *args) if qa_session_files.first.respond_to?(method)
    super
  end

  def scan_protocol
    qa_session_files.try(:first).try(:scan_protocol) || 'Unavailable'
  end

  def preview
    files[files.count/2].preview if files.count > 0
  end

  def previewable?
    !!preview
  end

  def status
    analysis_requests.try(:first).try(:status) || 'Unprocessed'
  end

  def report
    analysis_requests.try(:last)
  end

  def finalized?
    analysis_requests.count > 0
  end

  def to_s
    description
  end

  protected

    def assign_equipment
      self.equipment = qa_session.try(:equipment).try(:first)
    end
end
