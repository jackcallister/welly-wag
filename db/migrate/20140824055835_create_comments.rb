class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.integer :comment_id
      t.text :content, null: false

      t.timestamps
    end
  end
end
