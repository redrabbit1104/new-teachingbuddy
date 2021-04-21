class Schedule < ApplicationRecord
  belongs_to :sdate
  has_many :checks  
  has_one :confirm

  validates :subject, presence: true, length: { maximum: 25 }
  validates :start_time, presence: true
  validates :end_time, presence: true

  def self.search(search)
    if search != ""
      Schedule.where('subject LIKE(?)',"%#{search}%")
    end
  end
end
