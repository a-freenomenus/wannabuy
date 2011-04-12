class AddPriceAndOthersToResponses < ActiveRecord::Migration
  def self.up
    add_column :responses, :price, :string, :limit => 5
  end

  def self.down
    remove_column :responses, :price
  end
end
