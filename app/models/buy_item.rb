class BuyItem

  include ActiveModel::Model
  attr_accessor  :user_id, :item_id, :zip_number, :ken_id, :city_name, :block_name, :building_name, :phone_number

  # 以下にバリデーション記述
  with_options presence: true do
    validates :zip_number
    validates :ken_id
    validates :city_name
    validates :block_name
    validates :phone_number
  end
  validates :ken_id, numericality: { other_than: 1 , message: "Select"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_number: zip_number, ken_id: ken_id, city_name: city_name, block_name: block_name, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end