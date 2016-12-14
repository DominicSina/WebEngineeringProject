class Auction < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :bids
end
