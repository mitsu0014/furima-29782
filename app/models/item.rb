class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :postage
  belongs_to_active_hash :status
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :prefectures_id, numericality: { other_than: 0 }
  validates :shipping_date_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one :order
  has_one_attached :image
end
