require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品が成功する' do
      it '全ての項目に正常なデータが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '金額が半角数字であれば登録できる' do
        price = 1000
        expect(@item).to be_valid
      end
      it '金額の数値が300~9999999の間であれば登録できる' do
        price = 2000
        expect(@item).to be_valid
      end
    end

    context '商品出品が失敗する' do
      it '画像がアップロードされていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空だと登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'カテゴリーが選択されていないと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryを入力してください", 'カテゴリーを選択してください')
      end
      it '商品状態が選択されていないと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Statusを入力してください", '商品状態を選択してください')
      end
      it '配送料負担が選択されていないと登録できない' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping costを入力してください", '配送料負担を選択してください')
      end
      it '発送元が選択されていないと登録できない' do
        @item.shipment_score_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment scoreを入力してください", '発送元地域を選択してください')
      end
      it '発送日数が選択されていないと登録できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping dayを入力してください", '発送日数を選択してください')
      end
      it '金額が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("金額を入力してください")
      end
      it '金額が半角数字以外だと登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('金額は半角数字で入力してください','金額は300〜9,999,999の間で入力してください')
      end
      it '金額が300以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('金額は300〜9,999,999の間で入力してください')
      end
      it '金額が9999999以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('金額は300〜9,999,999の間で入力してください')
      end
      it 'カテゴリー選択でid:1が選択されている場合は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品状態選択でid:1が選択されている場合は登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品状態を選択してください')
      end
      it '配送料負担選択でid:1が選択されている場合は登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料負担を選択してください')
      end
      it '発送元選択でid:1が選択されている場合は登録できない' do
        @item.shipment_score_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元地域を選択してください')
      end
      it '発送日数選択でid:1が選択されている場合は登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送日数を選択してください')
      end
      it 'userと紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
