class AddChatEnabledToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :chat_enabled, :boolean, :default => true, :null => false
  end

  def self.down
    remove_column :users, :chat_enabled
  end
end
