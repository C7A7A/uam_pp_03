class ContactPeopleController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
    @contact = ContactPerson.find(params[:id])
  end

  def new
    @contact = ContactPerson.new
  end

  def edit
    @contact = ContactPerson.find(params[:id])
  end

  def create
    @contact = ContactPerson.new(contact_params)
    @contact.user_id = current_user.id
    
    if @contact.save
      redirect_to @contact, notice: 'Contact person was successfully created'
    else
      render :new
    end
  end

  def update
    @contact = ContactPerson.find(params[:id])

    if @contact.update(contact_params)
      redirect to @contact, notice: 'Contact person was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @contact = ContactPerson.find(params[:id])

    if @contact.is_deleted != true
      @contact.update(is_deleted: true)
      redirect_to contact_people_url, notice: 'Contact person was successfully deleted'
    else
      redirect_to contact_people_url, notice: 'Error: contact person wasn`t deleted'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :surname, :phone, :mail, :position, :id_company, :id_user, :is_deleted)
  end
end
