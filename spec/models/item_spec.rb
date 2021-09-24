require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品情報の登録' do
    context '登録できるとき' do
      it 'image, name, detail, category_id, condition_id, delivery_fee_id, prov_id, ship_days_id, price, user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '登録できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'detailが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end
      it 'category_idが選択されていない場合、登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが選択されていない場合、登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'delivery_fee_idが選択されていない場合、登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it 'prov_idが選択されていない場合、登録できない' do
        @item.prov_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prov can't be blank"
      end
      it 'ship_days_idが選択されていない場合、登録できない' do
        @item.ship_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship days can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300未満の場合、登録できない' do
        @item.price = Faker::Number.within(range: 0..300)
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが9999999より大きい場合、登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'priceが全角の場合、登録できない' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが英字の場合、登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end  
end
