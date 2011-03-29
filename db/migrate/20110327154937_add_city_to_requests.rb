class AddCityToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :city, :string
  end

  def self.down
    remove_column :requests, :city
  end
end
