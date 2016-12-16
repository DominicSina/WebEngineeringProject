class Auction < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :bids

  scope :shouldEnd, -> { where('end_time < ?', Time.now) }
  scope :notEnded, -> { where(active: false) }

  def end
    self.active=false
    self.save
  end

  def highestBid
    self.bids.order(amount: :desc).first
  end
end
