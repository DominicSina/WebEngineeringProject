class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :imgur_link

      t.timestamps
    end
  end
end
