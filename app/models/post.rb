class Post < ActiveRecord::Base

  validates :title, :sub, :author, presence: true

  belongs_to :author, class_name: "User"
  belongs_to :sub
  has_many :comments, as: :commentable

end
