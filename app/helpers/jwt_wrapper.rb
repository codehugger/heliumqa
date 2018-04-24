module JWTWrapper
  extend self

  def encode(payload)
    payload = payload.dup
    payload['exp'] = 24.hours.from_now.to_i

    JWT.encode payload, Rails.application.secrets.jwt_secret_key
  end

  def decode(token)
    decoded_token = JWT.decode token, Rails.application.secrets.jwt_secret_key
    decoded_token.first
  end
end
