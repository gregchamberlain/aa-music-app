class TracksController < ApplicationController

  before_action :authenticate
  before_action :find_track, only: [:show, :update, :edit, :destroy]

  def new
    @track = Track.new
    @albums = Album.all
  end

  def create
    track = Track.new(track_params)
    save(track)
  end

  def show
  end

  def edit
    @albums = Album.all
  end

  def index
    @tracks = Track.all
  end

  def update
    if @track.update(track_params)
      redirect_to @track
    else
      flash[:errors] = @track.error.full_messages
      redirect_to  edit_track_url(@track)
    end
  end

  def destroy
    if @track.destroy
      redirect_to tracks_url
    else
      flash.now[:errors] = @track.errors.full_messages
      render :show
    end
  end

  private
  def track_params
    params.require(:track).permit(:name, :lyrics, :kind, :album_id)
  end

  def find_track
    @track = Track.find(params[:id])
  end
end
