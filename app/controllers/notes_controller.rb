class NotesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end


  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'new'
    end

  end

  def destroy
    if @note.destroy
    redirect_to notes_path
    else
      flash[:notice] = "Something is wrong. Please try again"
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def set_note
    @note = Note.find(params[:id])
  end

end


