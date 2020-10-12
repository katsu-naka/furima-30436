require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品が成功する' do
      it "全ての項目に正常なデータが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "金額が半角数字であれば登録できる" do
        price = 1000
        expect(@item).to be_valid
      end
      it "金額の数値が300~9999999の間であれば登録できる" do
        price = 2000
        expect(@item).to be_valid
      end
    end

    context '商品出品が失敗する' do
      it "画像がアップロードされていないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品説明が空だと登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーが選択されていないと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category Select")
      end
      it "商品状態が選択されていないと登録できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status Select")
      end
      it "配送料負担が選択されていないと登録できない" do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank", "Shipping cost Select")
      end
      it "発送元が選択されていないと登録できない" do
        @item.shipment_score_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment score can't be blank", "Shipment score Select")
      end
      it "発送日数が選択されていないと登録できない" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank", "Shipping day Select")
      end
      it "金額が空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "金額が半角数字以外だと登録できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range", "Price Half-width number")
      end
      it "金額が300以下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range") 
      end
      it "金額が9999999以上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "userと紐づいていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
