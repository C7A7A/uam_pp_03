class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:login, :register, :create]

  def login
  end

  def register
    @user = User.new
  end

  def create
    @user = User.find_by(login: params[:login])
    # CR: Ta konstrukcja ponizej jest niebezpieczna. Jezeli @user == nil, to @user.authenticate zwróci 500, to nie ma metody authenticate dla klasy nil
    # raczej powinna byc zastosowana konstrukcja @user&.authenticate(params[:password]) (https://www.rubydoc.info/gems/rubocop/0.43.0/RuboCop/Cop/Style/SafeNavigation)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to companies_url, notice: "Logged in!"
      # CR: zasada jest taka -> jezeli string nie wymaga tego, to umieszcza sie go w apostrofach
      # 'witaj ' + name -> ok
      # "witaj " + name -> nie ok
      # "witaj uzytkowniku!" -> nie ok
      # "witaj #{name}" -> ok (nawet bardzo)
    else
      flash[:alert] = 'Email or password is invalid'
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Logged out!'
    # CR: url helper zamiast sciezki '/login'
  end
end
