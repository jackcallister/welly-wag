class AddVoteableIdAndVoteableTypeToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :voteable_id, :integer, null: false
    add_column :votes, :voteable_type, :string, null: false
  end
end
