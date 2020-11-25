class CompaniesController < ApplicationController
  load_and_authorize_resource

  def index
    @companies = Company.paginate(page: params[:page], per_page: 5).where.not(is_deleted: true)
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
    @industries = Industry.all
  end

  def edit 
    @company = Company.find(params[:id])
    @industries = Industry.all
  end

  def create 
  # CR: bialy znak linie wyzej. w paru miejscach rowniez, juz nie bede poprawial
    @user = User.find(params[:company][:user_id])

    @company = Company.new(company_params)

    @company.user_id = current_user.id

    respond_to do |f| 
      # CR: o tym gadalismy dzisiaj. respond_to mozna wyjebac. patrz przyklad z update
      if @company.save
        f.html { redirect_to @company, notice: 'Company was successfully created' }
        f.json { render :show, status: :created, location: @company }
      else
        @industries = Industry.all
        f.html { render :new }
        f.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update 
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated'
    else
      ender :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])

    respond_to do |f|
      if @company.is_deleted != true
        @company.is_deleted = true
        @company.save
        f.html { redirect_to companies_url, notice: 'Company was successfuly deleted' }
        f.json { head :no_content }
      else
        f.html { redirect_to companies_url, notice: 'Error: company wasn`t deleted' }
        f.json { render json: @company.errors, status: 422 }
      end
    end
  end

  # CR: dobrze jest zostawic jedna linie pusta po 'private'. (rubocop).
  # Ale to tylko zalozenia stylistyczne, rob jak chcesz, po prostu my tak robimy w formie
  private
  def company_params
    params.require(:company).permit(:name, :nip, :industry_id, :address, :city, :user_id, :is_deleted)
  end
  
# CR: pusta linia powyzej
end
