class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rating, presence: true
  validates :book_id, presence: true
  validates :user_id, presence: true

  def self.rate_book!(book)
    average_rating = Rating.where(book_id: book.id).average(:rating)
    book.average_rating = average_rating
    book.save!
  end
end
