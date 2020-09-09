class Item < ApplicationRecord

  belongs_to :users
  has_one : :orders

end
