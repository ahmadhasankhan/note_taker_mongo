class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @notes = Note.page params[:page]
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(note_params)
      redirect_to notes_path, notice: 'Successfully updated!' and return
    end

    render 'edit'
  end

  def destroy
    @note.destroy

    redirect_to notes_path, notice: 'Successfully deleted!'
  end

  def my_notes
    @notes = current_user.notes.page params[:page]
    render 'index'
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body, :all_tags)
  end
end