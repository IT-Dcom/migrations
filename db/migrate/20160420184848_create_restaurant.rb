class CreateRestaurant < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.datetime :address
      t.datetime :price
      t.timestamps null: false
    end
  end
end
