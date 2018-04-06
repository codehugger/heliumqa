class ScanSeries < ApplicationRecord
  # Relationships
  has_many :inspection_files, :dependent => :nullify

  # Validations
  validates :uid, presence: true, uniqueness: true

  def to_s
    description
  end
end
