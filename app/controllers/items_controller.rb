class ItemsController < ApplicationController
  before_action :unless_login_user, only: :new
  before_action :find_item, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    # @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :product_condition_id, :shipping_cost_id, :shipping_time_id,
                                 :shipping_area_id, :price, :image).merge(user_id: current_user.id)
  end

  def unless_login_user
    redirect_to root_path unless user_signed_in?
  end

  # def find_item
  # @item = Item.find(params[:id])
  # end
end
