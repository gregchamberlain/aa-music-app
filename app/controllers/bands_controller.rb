class BandsController < ApplicationController

  before_action :authenticate
  before_action :find_band, only: [:edit, :update, :show, :destroy]

  def new
    @band = Band.new
  end

  def show
  end

  def edit
  end

  def create
    @band = Band.new(band_params)
    save(@band)
  end

  def update
    if @band.update(band_params)
      redirect_to @band
    else
      flash.now[:errors] = @band.errors.full_messages
      redirect_to edit_band_url(@band)
    end
  end

  def index
    @bands = Band.all
  end

  def destroy
    if @band.destroy
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :show
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

  def find_band
    @band = Band.find(params[:id])
  end
end
