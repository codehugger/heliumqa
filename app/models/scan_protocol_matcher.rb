class ScanProtocolMatcher < ApplicationRecord
  # Relationships
  belongs_to :scan_protocol
  belongs_to :scan_header_tag
  belongs_to :value_type_matcher, optional: true

  # Delegations
  delegate :key, to: :scan_header_tag
  delegate :label, to: :scan_header_tag

  # Aliases
  alias :tag :scan_header_tag

  # Scopes
  scope :by_header_tag, ->{ includes(:scan_header_tag).order("scan_header_tags.label") }

  # Validations
  validates :scan_header_tag_id, uniqueness: { scope: :scan_protocol }
  validates :matcher, presence: true

  # Hooks
  before_validation :copy_matcher

  def matcher_value=(value)
  end

  def matcher_value
  end

  def matches?(input)
    case scan_header_tag.value_type.name
    when 'integer', 'float'
      Dentaku(matcher, x: BigDecimal.new(input))
    when 'array_integer'
      Dentaku(matcher, input.is_a?(Array) ? input.map { |x| BigDecimal.new(x) } : [BigDecimal.new(x)])
    when 'array_float'
      Dentaku(matcher, input.is_a?(Array) ? input.map { |x| BigDecimal.new(x) } : [BigDecimal.new(x)])
    else
      Dentaku(matcher, x: input)
    end
  end

  def self.from_tag(key, value)
    return nil if (key.nil?)
    tag = ScanHeaderTag.find_by(key: key)
    new(scan_header_tag: tag, value_type_matcher_id: 1, value: value.blank? ? '' : value.to_s.split('\\').join(', '))
  end

  protected

    def copy_matcher
      self.matcher = value_type_matcher.render_matcher(value) unless value_type_matcher.blank?
    end
end
