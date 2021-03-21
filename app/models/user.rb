class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name,:avatar, presence: true

  ValidEmail = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: ValidEmail }, uniqueness: true

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
    validates :password, confirmation: true, length: { minimum: 6 }
    validates :password_confirmation, length: { minimum: 6 }
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :last_name
    validates :first_name
  end

  has_one_attached :avatar
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_one :admin_room
  has_one :confirm
  has_many :admin_messages
  has_many :messages, dependent: :destroy
  has_many :boards
  has_many :schedules
  has_many :checks

end
