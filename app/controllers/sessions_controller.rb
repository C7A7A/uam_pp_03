class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(login: params[:login])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to companies_url, notice: "Logged in!"
    else
      flash[:alert] = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Logged out!'
  end
end
