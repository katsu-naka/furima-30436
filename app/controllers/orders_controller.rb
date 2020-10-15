class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_item = BuyItem.new
  end

  def create
    @buy_item = BuyItem.new(buy_params)
    if @buy_item.valid?
      @buy_item.save
      binding.pry
      redirect_to root_path #仮のパス
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy_item).permit(:zip_number, :ken_id, :city_name, :block_name, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
