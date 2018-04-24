class Api::V1::AuthenticationController < ApiController
  skip_before_action :authenticate

  def create
    user = User.find_by(email: params[:email])

    if user.try(:valid_password?, params[:password])
      render json: {auth_token: JWTWrapper.encode({ sub: user.id }), email: user.email}, status: :ok
    else
      render json: { errors: ['Invalid username / password'] }, status: :unauthorized
    end
  end
end
