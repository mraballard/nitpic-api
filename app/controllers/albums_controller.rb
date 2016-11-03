class AlbumsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  # index route for root/albums
  def index
    render json: Album.all
  end

  # index route for users/:id/albums
  def showall
    users_albums = Album.find_by(user_id: params[:id])
    if users_albums
      render json: {status: 200, albums: users_albums}
    else
      render json: {status: 422, message: "No content"}
    end
  end

  def create
    album = Album.new(album_params)
    if album.save
      render json: {status: 200, album: album}
    else
      render json: {status: 422, album: album}
    end
  end

  def show
    album = Album.find(params[:id])
    if album
      render json: {status: 200, album: album}
    else
      render json: {status: 422, message: "No content"}
    end
  end

  def update
    album = Album.find(params[:id])
    if album.update(album_params)
      render json: {status: 200, album: album}
    else
      render json: {status: 422, user: user}
    end
  end

  def destroy
    album = Album.destroy(params[:id])

    render json: {status: 204}
  end

  private
    def album_params
      params.required(:album).permit(:title, :description)
    end
end
