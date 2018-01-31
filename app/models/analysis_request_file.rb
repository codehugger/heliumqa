class AnalysisRequestFile < ApplicationRecord
  # Relationships
  belongs_to :analysis_request
  belongs_to :inspection_file

  delegate :original_filename, to: :inspection_file
  delegate :original_url, to: :inspection_file
end
