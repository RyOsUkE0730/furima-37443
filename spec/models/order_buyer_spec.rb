require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    @order_buyer = FactoryBot.build(:order_buyer)
  end

  describe '商品購入' do
    context '商品が購入できるとき' do
      it 'すべての記入項目が存在していれば、商品を購入できる' do
        expect(@order_buyer).to be_valid
      end
      it '建物名が存在しなくても、商品を購入できる' do
        @order_buyer.building_name = ""
        expect(@order_buyer).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it '郵便番号が空では購入できない' do
        @order_buyer.post_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end

      it '都道府県が空では購入できない' do
        @order_buyer.prefecture_id = '0'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では購入できない' do
        @order_buyer.municipalities = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空では購入できない' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @order_buyer.telephone_num = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Telephone num can't be blank", "Telephone num is invalid")
      end

      it '郵便番号が全角数字では購入できない' do
        @order_buyer.post_code = '０００−００００'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code is invalid")
      end

      it '郵便番号が[3桁-4桁]でなければ購入できない' do
        @order_buyer.post_code = '0000-0000'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code is invalid")
      end

      it '電話番号が全角数字では購入できない' do
        @order_buyer.telephone_num = '００００００００００'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Telephone num is invalid")
      end

      it '電話番号が[10桁もしくは11桁]でなければ購入できない' do
        @order_buyer.telephone_num = '00000000'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Telephone num is invalid")
      end
    end
  end
end

# bundle exec rspec spec/models/order_buyer_spec.rb 