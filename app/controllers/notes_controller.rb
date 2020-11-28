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
  end

  def update
  end

  def destroy
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
