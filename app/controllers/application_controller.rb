class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  include Pundit
  #protect_from_forgery #pundit setup requires this but the protect_from_forgery above should cover this

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
