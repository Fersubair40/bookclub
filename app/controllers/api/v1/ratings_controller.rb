class Api::V1::RatingsController < ApplicationController
  before_action :authenticate, only: [:create, :user_rating]

  def user_rating
    @ratings = Rating.where(user_id: current_user.id, book_id: params[:book_id]).includes(:user, :book)
    render json: @ratings
  end


  def create
    rating = current_user.ratings.build(rate_params)
    if rating.save
      book = Book.find(rate_params[:book_id])
      Rating.rate_book!(book)
      render json: {message: "book rated"}, status: :created
    else
      render json: {errors: rating.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @rating.destroy
    head 204
  end

  private
  def set_rating
    @rating = Rating.find(params[:id])
  end
  def rate_params
    params.require(:rating).permit(:rating, :book_id)
  end
end
