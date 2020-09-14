class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  before_action :set_item, only: [:edit, :show, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def update
    item = Item.find(params[:id])
    item.update(items_params)
    if item.save
      redirect_to root_path
    else
      render :show
    end
  end

  def new
    @item = ItemTag.new
  end

  def create
    @item = ItemTag.new(tags_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def show
    @message = Message.new
    @messages = @item.messages.includes(:user)
    @tag = Tag.find(params[:id])
  end

  def search
    @items = SearchItemsService.search(params[:keyword])
    # return nil if params[:input] == ""
    # tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"] )
    # render json:{ keyword: tag }
  end

  private

  def items_params
    params.require(:item).permit(:name, :image, :text, :price, :category_id, :status_id, :charge_id, :city_id, :day_id).merge(user_id: current_user.id)
  end

  def tags_params
    params.permit(:name, :image, :text, :price, :category_id, :status_id, :charge_id, :city_id, :day_id, :tag).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
