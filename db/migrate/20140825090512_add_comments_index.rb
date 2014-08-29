class AddCommentsIndex < ActiveRecord::Migration
  def change
    add_index :comments, [:parent_id, :parent_type]
  end
end
