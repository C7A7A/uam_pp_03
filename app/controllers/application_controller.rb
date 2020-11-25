class ApplicationController < ActionController::Base
  before_action :authorize
  
# CR: tu tez linia 3 niepotrzebny tab
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end 
    # CR: bialy znak na koncu powyzej
  end

  def authorize
    if !current_user # CR: Przy jednolinijkowym ifie lepsza jest konstrukcja inst if cond
      redirect_to '/login', :alert => 'You must be logged in to visit this page'
      # CR: sciezka - powinien byc url helper, od ruby 1.9 hashe przypisuje sie raczej przez dwukropek
    end
  end

  # CR: metode authorize lepiej zapisac tak w railsach.
  # To moze byc dziwne, jak ktos pierwszy raz spotyka sie z rubym, ale jest to lepsze stylistycznie
  def authorize_cr
    redirect_to login_url, alert: 'You must be logged in to visit this page' unless current_user
  end
end
