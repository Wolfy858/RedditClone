class ChangeVotesColumns < ActiveRecord::Migration
  def change
    remove_column(:votes, :value)
    add_column(:votes, :upvote, :boolean)
  end
end
