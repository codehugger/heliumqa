json.extract! analysis_request, :id, :key, :analysis_session_id, :created_at, :updated_at
json.url api_v1_analysis_request_url(analysis_request, format: :json)
