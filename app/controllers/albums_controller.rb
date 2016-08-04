class AlbumsController < ApplicationController

  before_action :authenticate
  before_action :find_album, only: [:show, :edit, :update, :destroy]

  def new
    @album = Album.new
    @bands = Band.all
  end

  def create
    album = Album.new(album_params)
    save(album)
  end

  def show
  end

  def index
    @albums = Album.all
  end

  def edit
    @bands = Band.all
  end

  def update
    if @album.update(album_params)
      redirect_to @album
    else
      flash.noew[:errors] = @album.errors.full_messages
      redirect_to edit_album_url(@album)
    end
  end

  def destroy
    if @album.destroy
      redirect_to albums_url
    else
      flash.now[:errors] = @album.errors.full_messages
      render :show
    end
  end

  private
  def album_params
    params.require(:album).permit(:name, :kind, :band_id)
  end

  def find_album
    @album = Album.find(params[:id])
  end
end
