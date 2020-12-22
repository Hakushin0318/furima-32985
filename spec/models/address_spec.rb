require 'rails_helper'
describe Address do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it "postal_code、prefecture_id、city、address、phone_numberが全てあれば登録できる" do
        expect(@address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it "postal_codeが空だと登録できない" do
      end
      it "postal_codeが数字だけだと登録できない" do
      end
      it "postal_codeが-を入れて9文字以上だと登録できない" do
      end
      it "postal_codeが-を入れて7文字以下だと登録できない" do
      end
      it "prefecture_idが空だと登録できない" do
      end
      it "prefecture_idが1だと登録できない" do
      end
      it "cityが空だと登録できない" do
      end
      it "addressが空だと登録できない" do
      end
      it "phone_numberが空だと登録できない" do
      end
    end
  end
end
