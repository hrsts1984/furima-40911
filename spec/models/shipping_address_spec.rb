require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.create(:order, user: @user, item: @item)
    @shipping_address = FactoryBot.build(:shipping_address, order: @order)
  end

  context '商品購入がうまくいくとき' do
    it '全ての値が正常であれば、購入できる' do
      expect(@shipping_address).to be_valid
    end
    it '建物名が空でも購入ができる' do
      @shipping_address.building = ""
      expect(@shipping_address).to be_valid
    end
  end

  context '商品購入がうまくいかないとき' do
    it '郵便番号が空だと購入できない' do
      @shipping_address.postal_code = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end
  end
end


