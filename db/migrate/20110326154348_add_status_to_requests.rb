class AddStatusToRequests < ActiveRecord::Migration
  def self.up
    # values ['not-started', 'started', 'finished', 'closed']
    add_column :requests, :status, :string, :null => false, :default => 'not-started'
  end

  def self.down
    remove_column :requests, :status
  end
end
