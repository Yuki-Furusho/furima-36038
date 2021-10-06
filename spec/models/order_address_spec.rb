require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '郵送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('app/assets/images/item-sample.png')
      item.save
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空だと保存できないこと' do 
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end

      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが3桁-4桁の形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'prov_idが選択されていない場合、保存できないこと' do
        @order_address.prov_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prov can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone can't be blank"
      end
      it 'phoneが10桁以下だと保存できないこと' do
        @order_address.phone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid"
      end
      it 'phoneは11桁以上だと保存できないこと' do
        @order_address.phone = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid"
      end
      it 'phoneに半角数値以外の値が入力された場合保存できないこと' do
        @order_address.phone = '111-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid"
      end


    end
  end
end
