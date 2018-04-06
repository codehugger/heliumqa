class Account < ApplicationRecord
  # Relationships
  has_many :sites, dependent: :destroy
  has_many :equipment, through: :sites
  has_many :inspections, through: :equipment
  has_many :inspection_files, through: :inspections
  has_many :analyses, through: :inspections
  has_many :analysis_requests, through: :analyses
  has_many :scan_protocols, through: :sites
  has_many :matchers, through: :scan_protocols
end
