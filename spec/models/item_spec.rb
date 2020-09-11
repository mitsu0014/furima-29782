require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての登録要素が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it '画像が空ではだめ' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it 'nameが空ではだめ' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '詳細が空ではだめ' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it '販売価格が入っていないとだめ' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格が¥300以上でないとだめ' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '販売価格が¥9999999以下でないとだめ' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '販売価格が半角数字でないとだめ' do
      @item.price = '１aAあア亜'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'カテゴリーが選択されてないとだめ' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態が選択されてないとだめ' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it '送料についてが選択されてないとだめ' do
      @item.postage_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage must be other than 1')
    end

    it '発送元が選択されてないとだめ' do
      @item.shipping_origin_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping origin must be other than 0')
    end

    it '発送日が選択されてないとだめ' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end
  end
end
