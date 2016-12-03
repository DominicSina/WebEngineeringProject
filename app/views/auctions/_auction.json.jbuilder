json.extract! auction, :id, :name, :description, :active, :end_time, :created_at, :updated_at
json.url auction_url(auction, format: :json)