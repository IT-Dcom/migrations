ass CreateRelayPoint < ActiveRecord::Migration
  def change
      create_table :realy_points do |t|
      t.datetime :zip
      t.datetime :address
      t.datetime :longitude
      t.datetime :latitude
      t.timestamps null: false
    end
  end
end
