class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show]

  def index
    @items = Item.all.order(created_at: 'DESC').includes(:user)
  end

  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def params_item
    params.require(:item).permit(:name, :explain, :category_id, :status_id, :delivery_pay_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user.id
    redirect_to action: :index if Order.find_by(item_id: @item.id)
  end
end
