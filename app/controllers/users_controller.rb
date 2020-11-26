class UsersController < ApplicationController
  # protect_from_forgery with: :null_session
  load_and_authorize_resource
  skip_authorize_resource only: [:new, :create, :register]
  skip_before_action :authorize, only: [:new, :create, :register]

  def index
    @users = User.paginate(page: params[:page], per_page: 5).where.not(is_deleted: true)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @roles = Role.all
  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created'
    else 
      @roles = Role.all
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfuly updated'
    else
      @roles = Role.all
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.is_deleted != true
      @user.update(is_deleted: true)

      redirect_to users_url, notice: 'User was successfully deleted'
    else
      redirect_to users_url, notice: 'Error: user wasn`t deleted'
    end
  end

  def register
    @user = User.new(user_params)

    if @user.save
      if !current_user
        session[:user_id] = @user.id
      end
      redirect_to companies_url, notice: 'You successfully registered!'
    else 
      render 'sessions/register'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :surname, :date_of_birth, :login, :password, :role_id, :is_deleted)
  end
end
