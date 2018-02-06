class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def current_account
    current_user.try(:account)
  end
  helper_method :current_account
end
