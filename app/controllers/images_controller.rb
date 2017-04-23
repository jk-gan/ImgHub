class ImagesController < ApplicationController
  def index
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
