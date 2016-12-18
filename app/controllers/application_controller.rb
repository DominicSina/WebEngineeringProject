class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #protect_from_forgery #pundit setup requires this but the protect_from_forgery above should cover this

  private
  def user_not_authorized
    #flash.now[:alert] = "Not autorized"
    redirect_to auctions_path, alert: "Not autorized"
  end

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
