class ScanHeaderTag < ApplicationRecord
  # Relationships
  belongs_to :mime_type
  belongs_to :value_type
  has_many :protocol_matchers, class_name: 'ScanProtocolMatcher', dependent: :destroy
  has_many :protocols, through: :protocol_matchers, source: :scan_protocol
  has_many :value_type_matchers, through: :value_type

  # Scopes
  default_scope ->{ order(:label) }

  def to_s
    "#{label} [#{key}]"
  end
end
