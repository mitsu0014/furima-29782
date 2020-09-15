require 'rails_helper'

RSpec.describe Buyer, type: :model do
  describe '#create' do
    before do
      @buyer = FactoryBot.build(:buyer)
    end

    it '全ての登録要素が存在すれば登録できること' do
      expect(@buyer).to be_valid
    end

    it '郵便番号が空ではだめ' do
      @buyer.postal = nil
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end

    it '郵便番号にハイフンがないとだめ' do
      @buyer.postal = 1234567
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end

    it '都道府県が選択されてないとだめ' do
      @buyer.prefectures_id = 0
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end

    it '市区町村が空ではだめ' do
      @buyer.city = nil
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end

    it '番地が空ではだめ' do
      @buyer.address = nil
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end

    it '電話番号が空ではだめ' do
      @buyer.phone = nil
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end

    it '電話番号が12桁以上ではだめ' do
      @buyer.phone = 123456789123
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include()
    end

  end
end
