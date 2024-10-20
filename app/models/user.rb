class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字を両方含めて設定してください' }, on: :create
  validates :family_name, presence: { message: "can't be blank" }
  # validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'はひらがな、カタカナ、漢字のみを使用できます' }
  validates :first_name, presence: { message: "can't be blank" }
  # validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'はひらがな、カタカナ、漢字のみを使用できます' }
  validates :family_name_kana, presence: { message: "can't be blank" }
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナのみを使用できます' }
  validates :first_name_kana, presence: { message: "can't be blank" }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナのみを使用できます' }
  validates :birth_day, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'はひらがな、カタカナ、漢字のみを使用できます' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'はひらがな、カタカナ、漢字のみを使用できます' }
end
