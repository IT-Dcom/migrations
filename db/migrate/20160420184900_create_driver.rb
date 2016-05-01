class CreateDriver < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.datetime :first_name
      t.datetime :last_name
      t.datetime :address
      t.timestamps null: false
    end
  end
end
