module Api
  module V1
    class AccountsController < ApiController
      def index
        render json: Account.all
      end
    end
  end
end
