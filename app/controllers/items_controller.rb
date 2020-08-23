class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.create(items_params)
    redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
  end

  private

  def items_params
    params.require(:item).permit(:name, :image, :text, :price, :category_id, :status_id, :charge_id, :city_id, :day_id).merge(user_id: current_user.id)
  end
end
