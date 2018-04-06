class ValueTypeMatcher < ApplicationRecord
  # Relationships
  belongs_to :value_type

  def render_matcher(value)
    Mustache.render(matcher, value: value)
  end
end
