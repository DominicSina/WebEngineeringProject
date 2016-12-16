class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction
  has_many :bids
end
