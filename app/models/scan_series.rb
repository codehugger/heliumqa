class ScanSeries < ApplicationRecord
  # Relationships
  has_many :qa_session_files, :dependent => :destroy

  # Validations
  validates :uid, presence: true, uniqueness: true

  alias files qa_session_files

  def scan_protocol
    qa_session_files.try(:first).try(:scan_protocol)
  end

  def preview
    files[files.count/2].preview
  end

  def to_s
    description
  end
end
