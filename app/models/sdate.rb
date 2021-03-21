class Sdate < ApplicationRecord
  has_many :schedules,dependent: :destroy

  validates :sdate, presence: true
end
