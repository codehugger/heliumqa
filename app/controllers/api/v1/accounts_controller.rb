class Api::V1::AccountsController < ApiController
  def index
    render json: Account.all
  end
end
