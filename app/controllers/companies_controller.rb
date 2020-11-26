class CompaniesController < ApplicationController
  load_and_authorize_resource

  def index
    @companies = Company.paginate(page: params[:page], per_page: 5).where.not(is_deleted: true)

    @companies = @companies.filter_by_industry(params[:industry_id]) if params[:industry_id].present?
    @companies = @companies.filter_by_date(params[:created_at]) if params[:created_at].present?
  
    @industries = Industry.all
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
    @company = Company.new(company_params)

    @company.user_id = current_user.id

    if @company.save
      redirect_to @company, notice: 'Company was successfully created'
    else
      @industries = Industry.all
      render :new
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])

    if @company.is_deleted != true
      @company.is_deleted = true
      @company.save
      redirect_to companies_url, notice: 'Company was successfuly deleted'
    else
      redirect_to companies_url, notice: 'Error: company wasn`t deleted'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :nip, :industry_id, :address, :city, :user_id, :is_deleted, :created_at)
  end
end
