class Equipment < ApplicationRecord
  # Relationships
  belongs_to :site
  has_many :inspections, dependent: :destroy
end
