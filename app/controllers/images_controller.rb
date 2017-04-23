class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_image, only: [:show, :edit, :update]

  def index
    @images = Image.all
  end

  def new
    @image = current_user.images.new
    authorize @image
  end

  def create
    @image = current_user.images.new(image_params)
    authorize @image
    if @image.save
      flash[:success] = "Image uploaded successfully"
      redirect_to @image
    else
      Rails.logger.info "Error #{@image.errors.full_messages}"
      flash[:error] = "Failed to upload image"
      render :new
    end
  end

  def edit
  end

  def update
    if @image.update(image_params)
      flash[:success] = "Image successfully edited"
      redirect_to @image
    else
      flash[:error] = "Failed to edit image"
      render :edit
    end
  end

  def show
  end

  def destroy
    @image = Image.find(params[:id]).destroy
    authorize @image
    flash[:success] = "Image deleted"
    redirect_to root_path
  end

  private

  def set_image
    @image = Image.find(params[:id])
    authorize @image
  end

  def image_params
  	params.require(:image).permit(
  		:name,
  		:description,
  		:image
  	)
  end
end
