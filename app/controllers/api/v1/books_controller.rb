class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def index
    @books = Book.order('created_at ASC').includes(:comments, :ratings).all
    render json: @books, each_serializer: BookSerializer
  end

  def show
    render json: BookSerializer.new(@book).serializable_hash.to_json
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
  ''
end
