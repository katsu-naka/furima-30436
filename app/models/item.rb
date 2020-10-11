class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  belongs_to_active_hash :category, :status
  # belongs_to_active_hash :status

  validates :title, :descripton, :category, :status, presence: ture
  validates :category_id,:status_id, numericality: { other_than: 1 }
end
