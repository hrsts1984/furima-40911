class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    redirect_to root_path if @item.order.present?
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :product_condition_id, :shipping_cost_id, :shipping_time_id,
                                 :shipping_area_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    redirect_to(root_path) unless current_user.id == @item.user_id
  end
end
