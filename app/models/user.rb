class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
