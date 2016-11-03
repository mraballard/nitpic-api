class PhotosController < ApplicationController
  def index
    render json: Album.find(params[:album_id]).photos
  end

  def create
    photo = Photo.new(photo_params)
    if photo.save
      render json: {status: 200, photo: photo}
    else
      render json: {status: 422, message: "No content"}
    end
  end

  def show
    photo = Photo.find(params[:id])
    render json: {status: 200, photo: photo}
  end

  def destroy
    photo = Photo.destroy(params[:id])
    render json: {status: 204}
  end

  private
    def photo_params
      params.required(:photo).permit(:title, :album_id)
    end
end
