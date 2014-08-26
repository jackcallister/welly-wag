class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.boolean :expired, default: false
      t.string :code, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
