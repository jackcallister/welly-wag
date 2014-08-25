class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.integer :recipient_id, null: false
      t.string :sender_type, null: false
      t.integer :sender_id, null: false

      t.timestamps
    end
  end
end
