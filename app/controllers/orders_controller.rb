class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:authenticity_token, :zip_code, :city_id, :city, :house_number, :building, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      # amount: order_params[:price], 
      card: order_params[:token],  
      amount: @item.price,
      currency:'jpy'
    ) 
  end
end
