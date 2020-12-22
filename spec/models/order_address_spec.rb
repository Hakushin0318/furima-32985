require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it "postal_code、prefecture_id、city、address、phone_numberが全てあれば登録できる" do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it "postal_codeが空だと登録できない" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが数字だけだと登録できない" do
        @order_address.postal_code = "222222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが空だと登録できない" do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1だと登録できない" do
      end
      it "cityが空だと登録できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと登録できない" do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが11桁以内出ないと登録できない" do
        @order_address.phone_number = 12345123451234
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
