class Buy
  include ActiveModel :: ActiveModel
  attr_accessor : :user_id, :item_id, :zip_number, :ken_id, :city_name, :block_name, :building_name, :phone_number, :order_id ,:token

  # 以下にバリデーション記述

  def save
    Address.create()
    Order.create()
end