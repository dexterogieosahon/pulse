class AddBlockedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blocked, :boolean, default: false
    add_column :users, :blocked_by, :integer
    add_index :users, :blocked
  end
end
