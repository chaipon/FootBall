class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :time
      t.references :game, index: true
      t.references :player, index: true
      t.boolean :is_our_goal

      t.timestamps
    end
  end
end
