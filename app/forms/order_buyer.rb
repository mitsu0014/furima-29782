class OrderBuyer

  include ActiveModel::Model
  attr_accessor :prefectures_id, :postal, :city, :address, :phone, :user_id, :item_id, :building, :token

  with_options presence: true do
    validates :postal, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefectures_id
    validates :city
    validates :address
    validates :phone, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :token

  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Buyer.create(postal: postal, prefectures_id: prefectures_id, city: city, address: address, building: building, phone: phone, order_id: order.id )
  end

end