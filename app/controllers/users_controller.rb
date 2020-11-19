class UsersController < ApplicationController
  # protect_from_forgery with: :null_session

  def index 
    @users = User.paginate(page: params[:page], per_page: 5)
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
        format.json { render :show, status: :created, location: @user}
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
        @user.is_deleted = true
        @user.save
        format.html { redirect_to users_url, notice: 'User was successfully deleted' }
        format.json { head :no_content }
      else
        format.html { redirect_to users_url, notice: 'Error: user wasn`t deleted' }
        format.json { render json: @user.errors, status: 422 }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :date_of_birth, :login, :password, :role_id, :is_deleted)
    end
end
