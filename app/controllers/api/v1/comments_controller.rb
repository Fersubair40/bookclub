class Api::V1::CommentsController < ApplicationController
  before_action :authenticate, only: [:create]
  before_action :set_comment, only: [:destroy]
  before_action :check_owner, only: [:destroy]

  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      render json: CommentSerializer.new(comment).serializable_hash.to_json, status: :created
    else
      render json: {message: comment.errors}, status: :unprocessable_entity
    end
  end

  def bookcomments
    @comments = Comment.where(book_id: params[:book_id]).includes(:user, :book)
    render json: @comments, status: :ok
  end


  def destroy
    @comment.destroy
    head 204
  end


  private
  def comment_params
    params.require(:comment).permit(:comment, :book_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
  def check_owner
    head :forbidden unless @comment.user_id == current_user&.id
  end
end
