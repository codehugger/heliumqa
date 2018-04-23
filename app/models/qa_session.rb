class QaSession < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :account
  has_many :qa_session_files, dependent: :destroy
  has_many :scan_protocols, through: :qa_session_files
  has_many :scan_series, through: :qa_session_files
  has_many :analysis_sessions, dependent: :destroy

  def self.unfinalized
    where(id: select { |s| s.analysis_sessions.count == 0 }.collect(&:id))
  end
end
