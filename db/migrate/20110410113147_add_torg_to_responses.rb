class AddTorgToResponses < ActiveRecord::Migration
  def self.up
    add_column :responses, :torg, :boolean, :default => false
  end

  def self.down
    remove_column :responses, :torg
  end
end
