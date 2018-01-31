class Account < ApplicationRecord
  # Relationships
  has_many :sites, dependent: :destroy
end
