class PhotosController < ApplicationController
  def index
    render json: Album.find(params[:album_id]).photos
  end

  def create
    puts photo_params[:title]
    puts photo_params[:image]
    album = Album.find(1)
    photo = Photo.new(photo_params)
    album.photos << photo

    if photo.save
      render json: { status: 200, message: 'Photo successfully uploaded', photo: photo}
     else
       render json: { status: 422, message: photo.errors.full_messages}
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
