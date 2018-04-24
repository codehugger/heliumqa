class FileResult < AnalysisResult
  include FileResultFileUploader::Attachment.new(:file)

  before_create :extract_data_uri

  def extract_data_uri
    self.file_data_uri = result_data.fetch("file_value", {})
  end
end
