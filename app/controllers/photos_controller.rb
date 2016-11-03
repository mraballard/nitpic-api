class PhotosController < ApplicationController
  def index
    render json: Album.find(params[:album_id]).photos
  end

  def create
    puts params
    # @photo = Photo.new(photo_params)
    # if photo.save
    #   render json: {status: 200, photo: photo}
    # else
    #   render json: {status: 422, message: "No content"}
    # end
  end

  def show
    photo = Photo.find(:photo_id)
    render json: {status: 200, photo: photo}
  end

  def destroy
    photo = Photo.destroy(params[:id])
    render json: {status: 204}
  end

  private
    # def photo_params
    #   params.required(:photo).permit(
    #     :title,
    #     :image_file_name,
    #     :image_content_type,
    #     :image_file_size,
    #     :image_updated_at
    #   )
    # end
end
