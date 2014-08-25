class RenameCommentIdToParentIdOnComments < ActiveRecord::Migration
  def up
    remove_column :comments, :comment_id
    add_column :comments, :parent_id, :integer, null: false
  end

  def down
    add_column :comments, :comment_id, :integer
    remove_column :comments, :parent_id
  end
end
