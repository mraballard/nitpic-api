class AlbumsController < ApplicationController
  before_action :set_user, only: [:index, :create]

  def index
    album = @user.album.find(album_params)
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def set_user
      @user = user.find(params[:user_id])
    end

    def album_params
      params.required(:album).permit(:title, :description)
    end
end
