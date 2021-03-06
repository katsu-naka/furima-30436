class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :messages,dependent: :destroy

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format: { with: NAME_REGEX, message: 'は全角で入力してください' }
    validates :last_name, format: { with: NAME_REGEX, message: 'は全角で入力してください' }
    validates :first_name_kana, format: { with: NAME_KANA_REGEX, message: 'は全角カタカナで入力してください' }
    validates :last_name_kana, format: { with: NAME_KANA_REGEX, message: 'は全角カタカナで入力してください' }
  end
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, format: { with: PASSWORD_REGEX, message: 'は半角英数字両方を含めて入力してください' }
end
