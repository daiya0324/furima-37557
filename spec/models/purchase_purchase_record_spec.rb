require 'rails_helper'

RSpec.describe PurchasePurchaseRecord, type: :model do
  describe '購入記録の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_purchase_record = FactoryBot.build(:purchase_purchase_record, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_purchase_record).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @purchase_purchase_record.building = ''
        expect(@purchase_purchase_record).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_purchase_record.postal_code = ''
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_purchase_record.postal_code = '1234567'
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_purchase_record.prefecture_id = 1
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_purchase_record.municipalities = ''
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_purchase_record.address = ''
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @purchase_purchase_record.phone_number = ''
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数値では保存できないこと' do
        @purchase_purchase_record.phone_number = '０９０１２３４５６７８'
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが10桁以下では保存できないこと' do
        @purchase_purchase_record.phone_number = '090123456'
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁以上では保存できないこと' do
        @purchase_purchase_record.phone_number = '090123456789'
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_purchase_record.user_id = nil
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_purchase_record.item_id = nil
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_purchase_record.token = nil
        @purchase_purchase_record.valid?
        expect(@purchase_purchase_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
