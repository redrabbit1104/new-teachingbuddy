class AdminRoom < ApplicationRecord
  has_many :admin_messages, dependent: :destroy
  belongs_to :user
  belongs_to :admin
end
