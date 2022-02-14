require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'すべての記入項目が存在していれば商品を登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明が空では登録できない' do
        @item.description =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態が空では登録できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担欄が空では登録できない' do
        @item.delivery_charge_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '発送元の地域が空では登録できない' do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空では登録できない' do
        @item.delivery_time_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      it '商品価格が空では登録できない' do
        @item.selling_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not included in the list")
      end

      it '商品価格が¥300以下では登録できない' do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not included in the list")
      end

      it '商品価格が¥10,000,000以上では登録できない' do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not included in the list")
      end

      it '商品価格が全角数字では登録できない' do
        @item.selling_price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not included in the list")
      end
    end
  end
end
