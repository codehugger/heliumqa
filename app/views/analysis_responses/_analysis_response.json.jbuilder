json.extract! analysis_response, :id, :analysis_request_id, :response_data, :created_at, :updated_at
json.url analysis_response_url(analysis_response, format: :json)
