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
    @user = User.find(params[:company][:user_id])

    @company = Company.new(company_params)

    @company.user_id = current_user.id

    respond_to do |f| 
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

    respond_to do |f|
      if @company.update(company_params)
        f.html { redirect_to @company, notice: 'Company was successfully updated' }
        f.json { render :show, status: :ok, location: @company }
      else
        f.html { render :edit }
        f.json { render json: @company.errors, satus: :unprocessable_entity }
      end
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

  private
  def company_params
    params.require(:company).permit(:name, :nip, :industry_id, :address, :city, :user_id, :is_deleted)
  end
  
end
