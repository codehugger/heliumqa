class AnalysisResponseFile < ApplicationRecord
  include AnalysisResponseFileUploader::Attachment.new(:file)
  # Relationships
  belongs_to :analysis_response
end
