class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format:{with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'First name Full-width characters'}
    validates :last_name, format:{with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Last name Full-width characters'}
    validates :first_name_kana,format:{with: /\A[ァ-ヶー－]+\z/, message: 'First name kana Full-width characters'}
    validates :last_name_kana,format:{with: /\A[ァ-ヶー－]+\z/,message: 'Last name kana Full-width characters' }
  end
  validates :email, uniqueness: true
  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers'}
end
