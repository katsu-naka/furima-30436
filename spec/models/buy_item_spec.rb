require 'rails_helper'

RSpec.describe BuyItem, type: :model do
  describe '購入機能' do
    before do
      @buy_item = FactoryBot.build(:buy_item)
    end

    context '商品購入に成功する' do
      it '全ての項目の値が正しく入力されている' do
        expect(@buy_item).to be_valid
      end
      it '建物名が空でも購入できる' do
        buiding_name = ''
        expect(@buy_item).to be_valid
      end
    end

    context '商品購入に失敗する' do
      it 'tokenが空だと購入できない' do
        @buy_item.token = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("カード情報を入力してください")
      end
      it '郵便番号が空だと登録できない' do
        @buy_item.zip_number = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号に「-」が含まれていない場合は購入できない' do
        @buy_item.zip_number = '1111111'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include('郵便番号はハイフンありで入力してください')
      end
      it '都道府県が選択されていないと購入できない' do
        @buy_item.ken_id = 1
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include('都道府県を選択してください')
      end
      it '市区町村が空だと購入できない' do
        @buy_item.city_name = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと購入できない' do
        @buy_item.block_name = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと購入できない' do
        @buy_item.phone_number = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号に「-」が含まれていると購入できない' do
        @buy_item.phone_number = '090-1111-1111'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include('電話番号は半角数字のみ入力してください')
      end
    end
  end
end
