class Auction < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :bids

  validates :user_id,:name,:end_time,:active, presence:true, on: :create
  validate :end_date_cannot_be_in_the_past
  validate :has_atleast_one_image

  scope :shouldEnd, -> { where('end_time < ?', Time.now) }
  scope :notEnded, -> { where(active: true) }

  def has_atleast_one_image
    if self.images.count<1
      #self.errors.add(:base,"Please upload an image")
    end
  end

  def end_date_cannot_be_in_the_past
    if(self.end_time <= Time.now && self.active)
      self.errors.add(:end_time,"has to be in the future")
    end
  end

  def end
    self.active=false
    self.save
  end

  def highestBid
    self.bids.order(amount: :desc).first
  end
end
