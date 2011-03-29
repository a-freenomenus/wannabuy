class AddCategoryToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :category_id, :integer
    add_index :requests, :category_id
  end

  def self.down
    remove_column :requests, :category_id
  end
end
