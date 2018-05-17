json.partial! "api/v1/analysis_requests/analysis_request", analysis_request: @analysis_request

json.specifications_file_url @analysis_request.scan_protocol.specifications_file_url
json.analysis_options_url @analysis_request.scan_protocol.analysis_options_file_url

json.qa_session_files @analysis_request.qa_session_files do |file|
  json.file_url file.file_url
  json.filename file.file.original_filename
end

json.phantom_module_files @analysis_request.scan_protocol.phantom_module_files.each do |file|
  json.file_url file.file_url
  json.filename file.file.original_filename
end
