class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :value
      t.integer :response_id
      t.integer :user_id

      t.timestamps
    end
    add_index :ratings, :response_id
    add_index :ratings, :user_id
  end

  def self.down
    drop_table :ratings
  end
end
