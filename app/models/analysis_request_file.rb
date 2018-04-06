class AnalysisRequestFile < ApplicationRecord
  # Relationships
  belongs_to :analysis_request
  belongs_to :inspection_file

  delegate :filename, to: :inspection_file
  delegate :url, to: :inspection_file
end
