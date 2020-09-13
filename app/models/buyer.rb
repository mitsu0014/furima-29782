class Buyer < ApplicationRecord
  belongs_to :orders

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefectures
    validates :city
    validates :address
    validates :phone, format: { with: /\A[0-9]+\z/ },length: { maxmum: 11 }, 
    validates :user_id,  foreign_key: true
  end
  validates :building
end

