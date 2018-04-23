class QaSessionFilePreview < ApplicationRecord
  include QaSessionFilePreviewUploader::Attachment.new(:file)

  # Relationships
  belongs_to :qa_session_file
end
