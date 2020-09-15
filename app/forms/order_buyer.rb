class OrderBuyer
  include ActiveModel::Model
  attr_accessor :prefectures_id, :postal, :city, :address, :phone, :user_id, :item_id, :building, :token

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_CODE_REGEX = /\A[0-9]+\z/.freeze
  
  with_options presence: true do
    validates :postal, format: { with: POSTAL_CODE_REGEX }
    validates :prefectures_id
    validates :city
    validates :address
    validates :phone, format: { with: PHONE_CODE_REGEX }, length: { maximum: 11 }
    validates :token
  end



  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Buyer.create(postal: postal, prefectures_id: prefectures_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end
