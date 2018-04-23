class Equipment < ApplicationRecord
  # Relationships
  belongs_to :site
  has_many :qa_sessions, dependent: :destroy
end
