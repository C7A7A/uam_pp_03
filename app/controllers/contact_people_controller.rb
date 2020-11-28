class ContactPeopleController < ApplicationController
  before_action :set_company
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource except: :create 

  def index
    @contacts = @company.contact_people
  end

  def show
  end

  def new
    @contact = @company.contact_people.new
  end

  def edit
  end

  def create
    @contact = @company.contact_people.new(contact_params)

    @contact.company_id = @company.id
    @contact.user_id = current_user.id

    if @contact.save
      redirect_to company_contact_people_url, notice: 'Contact person was successfully created'
    else
      render :new
    end
  end

  def update
    @contact.company_id = @company.id

    if @contact.update(contact_params)
      redirect_to company_contact_person_url, notice: 'Contact person was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    if @contact.is_deleted != true
      @contact.update(is_deleted: true)
      redirect_to company_contact_people_url, notice: 'Contact person was successfully deleted'
    else
      redirect_to company_contact_people_url, notice: 'Error: contact person wasn`t deleted'
    end
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_contact
    @contact = @company.contact_people.find(params[:id])
  end

  def contact_params
    params.require(:contact_person).permit(:name, :surname, :phone, :email, :position, :company_id, :user_id, :is_deleted)
  end
end
