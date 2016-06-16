class Sub < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, uniqueness: true

  belongs_to :moderator, class_name: :"User"
  has_many :posts

end
