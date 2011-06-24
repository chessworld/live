class AddUserSuspendUntil < ActiveRecord::Migration
  def self.up
    add_column :users, :suspend_until, :date
  end

  def self.down
    remove_column :users, :suspend_until
  end
end