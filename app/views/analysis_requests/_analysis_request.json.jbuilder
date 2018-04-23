json.extract! analysis_request, :id, :analysis_session_id, :created_at, :updated_at
json.url analysis_request_url(analysis_request, format: :json)
