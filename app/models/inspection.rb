class Inspection < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :equipment
  has_many :inspection_files, dependent: :destroy
  has_many :equipment_profiles, through: :inspection_files
  has_many :analyses, dependent: :destroy
  has_many :analysis_requests, through: :analyses
end
