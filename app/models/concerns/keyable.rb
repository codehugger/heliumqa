module Keyable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId

    # Validations
    validates :key, presence: true, uniqueness: true

    # Hooks
    before_validation :generate_key

    # Integration with FriendlyId
    friendly_id :key

    private
      def generate_key
        assign_attributes(key: SecureRandom.uuid)
      end
  end
end
