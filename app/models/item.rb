class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :status
    validates :postage
    validates :shipping_origin
    validates :shipping_date
    validates :price, format: { with: /\A[0-9]+\z/ },
    numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end 

  belongs_to :user
  has_one :orders
  has_one_attached :image

end
