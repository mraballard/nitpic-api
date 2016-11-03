class AlbumsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]

  def index

  end

  def show
  end

  def create
  end

  def update
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
