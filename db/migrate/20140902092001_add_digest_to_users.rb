class AddDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :send_digest, :boolean
  end
end
