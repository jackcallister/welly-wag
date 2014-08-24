class AddVotesIndex < ActiveRecord::Migration
  def change
    add_index :votes, [:voteable_id, :voteable_type]
  end
end
