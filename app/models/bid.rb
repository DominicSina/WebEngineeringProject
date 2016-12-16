class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  validates :auction_id, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
  validate :bigger_than_highest_bid_check

  def bigger_than_highest_bid_check
    if self.amount < self.auction.highestBid.amount
      errors.add(:amount, "has to be higher than current highest bid#{self.auction.highestBid.amount}.")
    end
  end
end
