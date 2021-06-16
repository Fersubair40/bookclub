class RatingSerializer < ActiveModel::Serializer
  attributes :id, :rating, :user_id, :book_id

  belongs_to :user
  belongs_to :book
end
