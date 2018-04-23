class Account < ApplicationRecord
  # Relationships
  has_many :sites, dependent: :destroy
  has_many :equipment, through: :sites
  has_many :qa_sessions
  has_many :qa_session_files, through: :qa_sessions
  has_many :analyses, through: :qa_sessions
  has_many :analysis_requests, through: :analyses
  has_many :scan_protocols, through: :sites
  has_many :matchers, through: :scan_protocols
end
