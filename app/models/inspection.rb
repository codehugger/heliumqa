class Inspection < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :equipment
  has_many :inspection_files, dependent: :destroy
  has_many :scan_protocols, through: :inspection_files
  has_many :analyses, dependent: :destroy
  has_many :analysis_requests, through: :analyses

  # Delegation
  delegate :site, to: :equipment
end
