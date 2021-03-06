class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze } do
      validates :password
    end

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶ々]+\z/ } do
      validates :first_name_ruby
      validates :last_name_ruby
    end
  end

  has_many :items
end
