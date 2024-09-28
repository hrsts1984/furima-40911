class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item),permit(:category_id, :product_condition_id, :shipping_cost_id, :shipping_area_id, :shipping_time_id, :product_name, :price, :image).merge(user_id: current_user.id)
  end
end
