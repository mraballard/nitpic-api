class PhotosController < ApplicationController
  before_action :set_album, only: [:index, :show]

  def index
    set_album
    render json: {status: 200, photos: @album.get_photos_data}
  end

  def create
    set_album
    photo = Photo.create(
      title: photo_params[:title],
      image: photo_params[:image],
      album_id: @album.id
    )

    if photo.save
      render json: { status: 200, message: 'Photo successfully uploaded', photo: photo}
     else
       render json: { status: 422, message: photo.errors.full_messages}
    end
  end

  def show
    photo = Photo.find(params[:id])

    render json: {status: 200, photo: photo, source: photo.get_photo_url}
  end

  def destroy
    photo = Photo.destroy(params[:id])

    render json: {status: 204}
  end

  private
    def set_album
      @album = Album.find(params[:album_id])
    end

    def photo_params
      # {photo: {title: " ", image: " "} } needs to be like this coming in
      params.required(:photo).permit(:title, :image)
    end
end
