class ApiController < ActionController::Base
  before_action :verify_jwt_token

  def verify_jwt_token
    head :unauthorized if request.headers['Authorization'].nil? ||
      !AuthToken.valid?(request.headers['Authorization'].split(' ').last)
  end
end
