class Image < ApplicationRecord
  belongs_to :auction

  #validates :imgur_link,:auction_id, presence:true
end
