class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address, dependent: :destroy

  def sold_out?
    item.present?
  end
end
