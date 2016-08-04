class NotesController < ApplicationController

  before_action :authenticate

  def create
    note = Note.new(note_params)
    note.user = current_user
    unless note.save
      flash[:errors] = note.errors.full_messages
    end
    redirect_to note.track
  end

  def destroy
    note = Note.find(params[:id])
    unless note.user == current_user
      render text: "This note doesn't belong to you!", status: 403
      return
    end
    unless note.destroy
      flash[:errors] = note.errors.full_messages
    end
    redirect_to note.track
  end

  private
  def note_params
    params.require(:note).permit(:body, :track_id)
  end
end
