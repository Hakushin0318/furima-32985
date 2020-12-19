require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '出品機能' do
    context '商品が保存できる場合' do
      it '画像と商品名、商品説明、カテゴリー、商品状態、配送料の負担、発送元の地域、発送までの日数、価格があれば保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品が保存できない場合' do
      it '画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明がないと保存できない' do
        @item.details = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end
      it 'カテゴリーがないと保存できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが1の時保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品状態がないと保存できない' do
        @item.state = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it '商品状態が1の時保存できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it '配送料の負担がないと保存できない' do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '配送料の負担が1の時保存できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it '発送元の地域がないと保存できない' do
        @item.delivery_source = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source can't be blank")
      end
      it '発送元の地域が1の時保存できない' do
        @item.delivery_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source must be other than 1")
      end
      it '発送までの日数がないと保存できない' do
        @item.delivery_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it '発送までの日数が1の時保存できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end
      it '価格がないと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は300円以下だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格は9999999円以上だと保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格は半角数字出ないと保存できない' do
        @item.price = "２３４６６"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
