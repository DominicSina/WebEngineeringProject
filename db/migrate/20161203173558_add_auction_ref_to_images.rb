class AddAuctionRefToImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :auction, foreign_key: true
  end
end
