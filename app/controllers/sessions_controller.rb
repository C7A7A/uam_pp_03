class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:login, :register, :create]

  def login
  end

  def register
    @user = User.new
  end

  def create
    @user = User.find_by(login: params[:login])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to companies_url, notice: 'Logged in!'
    else
      flash[:alert] = 'Email or password is invalid'
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: 'Logged out!'
  end
end
