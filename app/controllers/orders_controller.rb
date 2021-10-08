class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    item_find
    @order_address = OrderAddress.new
    if current_user == @item.user || Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def create
    item_find
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prov_id, :city, :address, :building, :phone, :item_id).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
