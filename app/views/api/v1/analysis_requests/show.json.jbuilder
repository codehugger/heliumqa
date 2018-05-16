json.partial! "api/v1/analysis_requests/analysis_request", analysis_request: @analysis_request
json.qa_session_files @analysis_request.qa_session_files do |file|
  json.file_url file.file_url
  json.filename file.file.original_filename
end
