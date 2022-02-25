require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテムの保存' do
    context 'アイテムが投稿できる場合' do
      it 'name,description,category_id,status_id,shipping_fee_burden_id,prefecture_id,shipping_date_id,price,imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが¥300~¥9,999,999であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが半角数値であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context 'アイテムが投稿できない場合' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'status_idが空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'shipping_fee_burden_idが空では出品できない' do
        @item.shipping_fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee burden can't be blank"
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'shipping_date_idが空では出品できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'priceが¥300より少ない時は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 299'
      end
      it 'priceが¥9999999より少ない時は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end
    end
  end
end
