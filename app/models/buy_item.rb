class BuyItem

  include ActiveModel::Model
  attr_accessor  :user_id, :item_id, :zip_number, :ken_id, :city_name, :block_name, :building_name, :phone_number, :token

  ZIP_NUMBER_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A\d{11}\z/.freeze

  with_options presence: true do
    validates :zip_number, format: {with: ZIP_NUMBER_REGEX, message: "Input correctly" }
    validates :ken_id 
    validates :city_name
    validates :block_name
    validates :phone_number, format: {with: PHONE_NUMBER_REGEX, message: "Input only number" }
    validates :token
  end
  validates :ken_id, numericality: { other_than: 1 , message: "Select"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_number: zip_number, ken_id: ken_id, city_name: city_name, block_name: block_name, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end