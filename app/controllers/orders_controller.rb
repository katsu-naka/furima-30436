class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_buy_item, only: [:index, :create]
  before_action :move_to_root_path, only: :index

  def index
    @buy_item = BuyItem.new
  end

  def create
    @buy_item = BuyItem.new(buy_params)
    if @buy_item.valid?
      pay_item
      @buy_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy_item).permit(:zip_number, :ken_id, :city_name, :block_name, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = Rails.application.credentials.payjp['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_buy_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    if @item.user_id == current_user.id || @item.order
    redirect_to root_path 
    end
  end
end
