class BookSerializer < ActiveModel::Serializer
  cache key: 'book', expires_in: 1.hour
  attributes :id, :title, :author,:description, :average_rating,:list_name, :book_link, :book_image, :primary_isbn10, :primary_isbn13

  has_many :comments
  has_many :ratings
end
