class PhotosController < ApplicationController
  def index
    render json: Album.find(params[:album_id]).photos
  end

  def create
    photo = Photo.create(photo_params)

    if photo.save
      render json: { status: 200, message: 'Photo successfully uploaded'}
     else
       render json: { status: 422, message: 'Upload Unsuccessful!'}
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
      # {photo: {title: " ", image: " "} } needs to be like this coming in
      params.required(:photo).permit(:title, :image)
    end
end
