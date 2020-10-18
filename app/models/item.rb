class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipment_score
  belongs_to_active_hash :shipping_day

  PRICE_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :category
    validates :status
    validates :shipping_cost
    validates :shipment_score
    validates :shipping_day
    validates :price
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300〜9,999,999の間で入力してください' }
  validates :price, numericality: { with: PRICE_REGEX, message: 'は半角数字で入力してください' }

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipment_score_id
    validates :shipping_day_id
  end
end
