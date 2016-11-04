class PhotosController < ApplicationController
  def index
    render json: Album.find(params[:album_id]).photos
  end

  def create
    puts photo_params
    # params coming through are
    # puts  params[:title]
    # puts  params[:image]

    # photo = Photo.new(params)
    #
    # if photo.save
    #   render json: { status: 200, message: 'Photo successfully uploaded'}
    #  else
    #    render json: { status: 422, message: 'Upload Unsuccessful!'}
    # end

    # @photo = Photo.new(photo_params)
    # if photo.save
    #   render json: {status: 200, photo: photo}
    # else
    #   render json: {status: 422, message: "No content"}
    # end
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
      params.require(:photo).permit(:title, :image)
    end
end
