class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  belongs_to_active_hash :category

  validates :title, :descripton, :category, presence: ture
  validates :category_id, numericality: { other_than: 1 }
end
