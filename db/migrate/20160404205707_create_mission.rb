class CreateMission < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.datetime :assigned_at
      t.datetime :completed_at
      t.timestamps null: false
    end
  end
end
