class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # force_ssl
  include ApplicationHelper

  before_action :require_login

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end

  private

  helper_method :current_user
end
