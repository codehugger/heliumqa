class ValueType < ApplicationRecord
  # Relationships
  has_many :scan_header_tags
  has_many :value_type_matchers
end
