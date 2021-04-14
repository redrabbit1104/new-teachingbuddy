class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter]
  validates :user_name, presence: true, length: { maximum: 10 }
  validates :avatar, presence: true

  ValidEmail = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  #uniqueness: { case_sensitive: false } -> falseにすることによって大文字と小文字の違いを区別しない。 TOM != tom
  validates :email, presence: true, format: { with: ValidEmail }, uniqueness: { case_sensitive: false }

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
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
  end

end
