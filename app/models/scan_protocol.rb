class ScanProtocol < ApplicationRecord
  # Relationships
  belongs_to :site
  has_many :qa_session_files, dependent: :nullify
  has_many :matchers, class_name: "ScanProtocolMatcher", dependent: :destroy

  # Nested attributes
  accepts_nested_attributes_for :matchers,
                                allow_destroy: true,
                                reject_if: ->(att) { att['matcher'].blank? && att['value_type_matcher_id'].blank? }

  # Validations
  validates :name, presence: true, uniqueness: { scope: :site }

  # Aliases
  alias :scan_protocol_matchers :matchers

  # Scopes
  # - protocols matching as a subset of header
  scope :matching, ->(header) { where(id: (select { |sp| sp.matches?(header) }.collect(&:id))) }

  # - order by protocol key count
  scope :most_specific, -> { left_joins(:matchers)
                            .group(:id)
                            .order('COUNT(scan_protocol_matchers.id) DESC') }

  def matches?(header)
    matchers.all? do |spm|
      (header.key?(spm.key) && spm.matches?(header[spm.key]))
    end
  end
end
