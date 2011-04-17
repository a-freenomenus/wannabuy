class CreateValues < ActiveRecord::Migration
  def self.up
    create_table :values do |t|
      t.string :name
      t.integer :criterion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :values
  end
end
