require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end
  describe '商品購入登録' do
    context '商品購入がうまくいくとき' do
      it '全ての値が正常であれば、購入できる' do
        expect(@order_form).to be_valid
      end
      it '建物名が空でも購入ができる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空だと購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '配送先の地域についての情報が0だと登録できない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it '市町村が空だと登録できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと登録できない' do
        @order_form.addresses = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が空だと登録できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '郵便番号にハイフンが必須であること' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end

      it '電話番号にハイフンが不要であること' do
        @order_form.phone_number = '090-1234-5689'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は11桁で以内あること' do
        @order_form.phone_number = '090123412345'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は9桁以内では登録できない' do
        @order_form.phone_number = '090123412'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'userが空だと登録できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが空だと登録できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'トークンが空だと購入できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
