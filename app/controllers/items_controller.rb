class ItemsController < ApplicationController
  def index
  end

  private

  def params_item
    params.require(:item).permit(:name, :explain, :category_id, :status_id, :delivery_pay_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
