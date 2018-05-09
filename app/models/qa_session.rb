class QaSession < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :account
  has_many :scan_series, dependent: :destroy
  has_many :qa_session_files, dependent: :destroy
  has_many :scan_protocols, through: :qa_session_files
  has_many :analysis_sessions, dependent: :destroy

  before_save :set_default_values

  delegate :equipment, to: :account

  def analyzed_file_count
    qa_session_files.select { |f| f.scan_attributes_extracted }.count
  end

  def analyzed_file_ratio
    return 0 if qa_session_files.count == 0
    ((analyzed_file_count.to_f / qa_session_files.count) * 100).to_i
  end

  def set_default_values
    self.performed_at ||= Time.now
  end

  def self.unfinalized
    where(id: select { |s| s.analysis_sessions.count == 0 }.collect(&:id))
  end
end
