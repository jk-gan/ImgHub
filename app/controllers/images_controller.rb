class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = current_user.images.new
  end

  def create
    @image = current_user.images.new(image_params)
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
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:success] = "Image successfully edited"
      redirect_to @image
    else
      flash[:error] = "Failed to edit image"
      render :edit
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
  	params.require(:image).permit(
  		:name,
  		:description,
  		:image
  	)
  end
end
