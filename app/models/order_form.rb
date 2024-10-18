class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order_form = Order.create(user_id:, item_id:)

    ActiveRecord::Base.transaction do
      # 購入情報を保存

      # 発送先情報を保存
      ShippingAddress.create!(
        postal_code:, prefecture_id:, city:,
        house_number:, building:, phone_number:,
        order_id: order_form.id
      )
    end
  end
end
