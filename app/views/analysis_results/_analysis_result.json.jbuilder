json.extract! analysis_response, :id, :key, :label, :analysis_request_id, :created_at, :updated_at
json.partial! "#{result.type.underscore}", result: result
json.url analysis_response_url(analysis_response, format: :json)
