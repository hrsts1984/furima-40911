class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_form = OrderForm.new
    return unless @item.order.present? || current_user.id == @item.user_id

    redirect_to root_path
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item

      @order_form.save
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      puts @order_form.errors.full_messages
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :price).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = 'sk_test_924403446d88cb8e4f19d01b' # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
