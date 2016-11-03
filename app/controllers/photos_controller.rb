class PhotosController < ApplicationController
  def index
    render json: Album.find(params[:album_id]).photos
  end

  def create
    # puts params
    # params coming through are
    # puts  params[:title]
    # puts  params[:image].original_filename
    # puts  params[:image].content_type

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
    #     :image
    #   )
    #   I have to figure out how to match the
    #   form data coming in to match the model
    # end
end
