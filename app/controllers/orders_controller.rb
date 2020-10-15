class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new(buy_params)
    if @buy_item.valid?
      pay_item
      @buy_item.save
      redirect_to root_path #仮のパス
    # else
    #   render root_path
    end
  end

  private

  def buy_params
    params.require(:buy_item).permit(:zip_number, :ken_id, :city_name, :block_name, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end
