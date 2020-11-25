class UsersController < ApplicationController
  # protect_from_forgery with: :null_session
  load_and_authorize_resource
  skip_authorize_resource :only => [:new, :create, :register]
  # CR: od ruby 1.9 lepsza jest konstrukcja przypisania hashy - only: [:new, :create, :register]
  skip_before_action :authorize, only: [:new, :create, :register]

  def index 
  # CR: bialy znak
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

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created' }
        format.json { render :show, status: :created, location: @user} # CR: w nawiasach klamrowych dobrze jest zostawic spacje na pcczatku i na koncu zawartosci (po @user)
      else 
        @roles = Role.all
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update 
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfuly updated' }
        format.json { render :show, status: :ok, location: @user}
      else
        @roles = Role.all
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.is_deleted != true
        @user.update(is_deleted: true)

        format.html { redirect_to users_url, notice: 'User was successfully deleted' }
        format.json { head :no_content }
      else
        format.html { redirect_to users_url, notice: 'Error: user wasn`t deleted' }
        format.json { render json: @user.errors, status: 422 }
      end
    end
  end

  def register
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        if !current_user
          session[:user_id] = @user.id
        end
        format.html { redirect_to companies_url, notice: 'You successfully registered!' }
        format.json { render :index, status: :registered, location: companies_url}
      else 
        @roles = Role.all
        format.html { render 'sessions/register' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Tutaj wciecie w private o jeden za duzo. private to nie jest blok, wiec powinno byc wszystko w jednej glebokosci
  def user_params
    params.require(:user).permit(:name, :surname, :date_of_birth, :login, :password, :role_id, :is_deleted)
  end
end
