class Board < ApplicationRecord
  validates :post, presence: true, length: { maximum: 30 }

  belongs_to :user
end
