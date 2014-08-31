class RemoveInvites < ActiveRecord::Migration
  def up
    drop_table :invites

    remove_column :users, :code
  end

  def down
    create_table :invites do |t|
      t.boolean :expired, default: false
      t.string :code, null: false
      t.integer :user_id

      t.timestamps
    end

    add_column :users, :code, :string
  end
end
