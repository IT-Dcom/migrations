class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.datetime :name
      t.datetime :weight
      t.datetime :condition
      t.timestamps null: false
    end
  end
end
