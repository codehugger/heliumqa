class EquipmentProfile < ApplicationRecord
  # Relationships
  belongs_to :site
  has_many :inspection_files

  # Scopes
  # - profiles matching as a subset of header
  scope :matching, ->(header) { where('profile_data <@ ?', header.to_json) }

  # - order by profile key count
  scope :order_by_most_specific, -> { reorder('(select count(*) from jsonb_object_keys(profile_data)) DESC') }

  # virtual attribute (setter) to use with forms
  def profile=(data)
    self.profile_data = JSON.parse(data) if data.is_a?(String)
  end

  # virtual attribute (getter) to use with forms
  def profile
    profile_data.to_json
  end

  class HeaderValue
    attr_accessor :name, :percentage

    def initialize(hash)
      @name          = hash['name']
      @percentage    = hash['percentage'].to_i
    end
  end
end
