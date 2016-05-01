class CreateInsurance < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.datetime :name
      t.datetime :price
      t.timestamps null: false
    end
  end
end
