class ApiController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :reset_session
  before_action :authenticate

  protected

    def logged_in?
      !!current_user
    end

    def current_user
      if auth_present?
        user = User.find(auth["sub"])
        if user
          @current_user ||= user
        end
      end
    end

    def token
      request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
    end

    def authenticate
      render json: {error: "unauthorized"}, status: :unauthorized unless logged_in?
    end

    def auth
      JWTWrapper.decode(token)
    end

    def auth_present?
      !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
    end
end
