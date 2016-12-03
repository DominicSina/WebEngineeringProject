class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.datetime :end_time

      t.timestamps
    end
  end
end
