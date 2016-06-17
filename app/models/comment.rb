class Comment < ActiveRecord::Base

  belongs_to    :commentable, polymorphic: true
  belongs_to    :user, class_name: :User
  has_many      :votes, as: :voteable

  def karma
    votes.select {|vote| vote.upvote}.count -
    votes.select {|vote| !vote.upvote}.count
  end

end
