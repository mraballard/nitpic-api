class CommentsController < ApplicationController
  before_action :authenticate, only: [:create, :destroy]
  before_action :set_photo, only: [:index, :create, :destroy]

  def index
    set_photo
    render json: {status: 200, comments: @photo.comments}
  end

  def create
    comment = Comment.create(
      body: comment_params[:body],
      photo_id: @photo.id
    )

    if comment.save
      render json: {status: 200, comments: @photo.comments}
    else
      render json: {status: 422, message: "No content"}
    end
  end

  def destroy
    set_photo
    comment = Comment.destroy(params[:id])
    render json: {status: 200, comments: @photo.comments}
  end

  private
    def set_photo
      @photo = Photo.find(params[:photo_id])
    end

    def comment_params
      params.required(:comment).permit(:body)
    end
end
