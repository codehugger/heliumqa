json.extract! scan_protocol, :id, :site_id, :name, :created_at, :updated_at
json.specifications_file_url scan_protocol.specifications_file_url
json.analysis_options_file_url scan_protocol.analysis_options_file_url
json.url scan_protocol_url(scan_protocol, format: :json)
json.phantom_module_files scan_protocol.phantom_module_files.each do |file|
  json.file_url file.file_url
  json.filename file.file.original_filename
end
