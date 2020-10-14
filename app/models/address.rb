class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ken
  belongs_to :order

  with_options presence: true do
    validates :zip_number
    validates :ken
    validates :city_name
    validates :block_name
    validates :phone_number
  end
  validates :ken_id, numericality: { other_than: 1 , message: "Select"}
end
