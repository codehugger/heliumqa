class InspectionFilePreview < ApplicationRecord
  include InspectionFilePreviewUploader::Attachment.new(:file)

  # Relationships
  belongs_to :inspection_file
end
