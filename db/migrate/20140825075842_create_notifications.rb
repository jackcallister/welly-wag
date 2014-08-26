class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.integer :recipient_id, null: false
      t.string  :notifiable_type, null: false
      t.integer :notifiable_id, null: false

      t.timestamps
    end
  end
end
