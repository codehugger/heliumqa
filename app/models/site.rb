class Site < ApplicationRecord
  # Relationships
  belongs_to :account
  has_many :equipment, dependent: :destroy
  has_many :equipment_profiles, dependent: :destroy
end
