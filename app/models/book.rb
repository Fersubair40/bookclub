class Book < ApplicationRecord
  self.implicit_order_column = "created_at"
  has_many :comments
  has_many :ratings
end
