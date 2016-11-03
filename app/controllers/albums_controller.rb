class AlbumsController < ApplicationController
  def index
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
    def album_params
      params.required(:album).permit(:title, :description)
    end
end
