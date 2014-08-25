class AddNotificationsIndex < ActiveRecord::Migration
  def change
    add_index :notifications, [:sender_id, :sender_type]
  end
end
