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
    if !current_user
      redirect_to '/login', :alert => 'You must be logged in to visit this page'
    end
  end
end
