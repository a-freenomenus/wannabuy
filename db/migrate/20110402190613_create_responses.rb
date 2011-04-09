class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.string :description
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
    add_index :responses, :user_id
    add_index :responses, :request_id
  end

  def self.down
    drop_table :responses
  end
end
