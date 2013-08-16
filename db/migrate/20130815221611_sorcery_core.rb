class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name,         :null => false  # if you use another field as a username, for example email, you can safely remove this field.
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil
      t.integer :team_id,      :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
