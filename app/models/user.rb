class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format:{with: NAME_REGEX, message: 'Full-width characters'}
    validates :last_name, format:{with: NAME_REGEX, message: 'Full-width characters'}
    validates :first_name_kana,format:{with: NAME_KANA_REGEX, message: 'Full-width katakana characters'}
    validates :last_name_kana,format:{with: NAME_KANA_REGEX, message: 'Full-width katakana characters' }
  end
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, format:{with: PASSWORD_REGEX, message: 'Include both letters and numbers'}
end
