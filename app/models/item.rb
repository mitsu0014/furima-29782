class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :exhibitor
    validates :category
    validates :status
    validates :postage
    validates :shopping_origin
    validates :shopping_date
    validates :price, format: { with: /\A[0-9]+\z/ },length: { minimum: 300, maxmum: 9999999 }

  end 

  belongs_to :users
  has_one :orders
  has_one_attached :image

end
