class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction

  validates :auction_id,:user_id, presence: true, on: :create
  validates :amount, presence: true, numericality: { only_integer: true }, on: :create
  validate :bigger_than_highest_bid_check
  validate :is_auction_still_active

  def is_auction_still_active
    if !self.auction.active
      errors.add(:auction_id, "has to reference an active auction. No betting on finished auctions possible")
    end
  end

  def bigger_than_highest_bid_check
    highestBid=self.auction.highestBid
    if highestBid!=nil&&self.amount < highestBid.amount
      errors.add(:amount, "has to be higher than current highest bid(#{highestBid.amount})")
    end
  end
end
