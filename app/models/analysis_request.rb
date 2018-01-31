class AnalysisRequest < ApplicationRecord
  include Keyable

  # Relationships
  belongs_to :analysis
  belongs_to :equipment_profile
  has_one :analysis_response, dependent: :destroy
  has_many :analysis_request_files, dependent: :destroy

  delegate :response_data, to: :analysis_response
end
