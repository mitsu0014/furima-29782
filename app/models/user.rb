class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :email, uniqueness: { case_sensitive: true }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, length: { minimum: 6 }, confirmation: true
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :kana_family_name, format: { with: /\A[ァ-ン一-]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :kana_first_name, format: { with: /\A[ァ-ン一-]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_day
  end
end
