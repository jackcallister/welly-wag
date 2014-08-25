class AddParentTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :parent_type, :string, null: false
  end
end
