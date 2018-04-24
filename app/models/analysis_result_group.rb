class AnalysisResultGroup < ApplicationRecord
  belongs_to :analysis_response
  has_many :results, class_name: "AnalysisResult", dependent: :destroy

  accepts_nested_attributes_for :results
end
