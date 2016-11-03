class CommentsController < ApplicationController
  def index
    comments = Photo.find(:photo_id).comments
    render json: {status: 200, comments: comments}
  end

  def create
    comment = Commment.new(comment_params)
    if comment.save
      render json: {status: 200, comment: comment}
    else
      render json: {status: 422, message: "No content"}
    end
  end

  def destroy
    comment = Comment.destroy(params[:id])
    render json: {status: 204}
  end

  private
    def commment_params
      params.required(:comment).permit(:body)
    end
end
