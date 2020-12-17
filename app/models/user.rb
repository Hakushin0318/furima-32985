class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :password, format: { with: /\A[a-z0-9]+\z/i }  
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :last_name_ruby, presence: true, format: { with: /\A[ァ-ヶ々]+\z/ }
  validates :first_name_ruby, presence: true, format: { with: /\A[ァ-ヶ々]+\z/ }
  validates :birthday, presence: true
end
