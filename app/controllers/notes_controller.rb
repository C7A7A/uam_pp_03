class NotesController < ApplicationController
  before_action :set_company
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @notes = @company.notes
  end

  def show
  end

  def new
    @note = @company.notes.new
  end

  def edit
  end

  def create
    @note = @company.notes.new(note_params)

    @note.user_id = current_user.id
    @note.company_id = @company.id

    if @note.save
      redirect_to company_note_url, notice: 'Note was successfully created'
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      redirect_to company_note_url, notice: 'Note was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    if @note.is_deleted != true
      @note.update(is_deleted: true)
      redirect_to company_notes_url, notice: 'Note was successfully deleted'
    else
      redirect_to company_notes_url, notice: 'Error: note wasn`t deleted'
    end
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_note
    @note = @company.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
