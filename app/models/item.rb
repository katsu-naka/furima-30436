class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  belongs_to_active_hash :category, :status, :shipping_cost, :shipment_score, :shipping_days

  validates :title, :descripton, :category, :status, :shipping_cost, :shipment_score, :shipping_day, presence: ture
  validates :category_id,:status_id, :shipping_cost_id, :shipment_score_id, :shipping_day_id, numericality: { other_than: 1 }
end
