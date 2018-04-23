class AnalysisResponse < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :analysis_request
  has_many :analysis_results
end
