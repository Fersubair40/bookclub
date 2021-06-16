class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :book_id, :user_id, :created_at
  belongs_to :user
  belongs_to :book
end
