class ApplicationController < ActionController::Base
  before_action :authorize
  
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def authorize
    redirect_to login_url, alert: 'You must be logged in to visit this page' unless current_user
  end
end
