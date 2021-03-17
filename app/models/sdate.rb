class Sdate < ApplicationRecord
  has_many :schedules,dependent: :destroy
end
