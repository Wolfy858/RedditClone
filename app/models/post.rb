class Post < ActiveRecord::Base

  validates :title, :sub, :author, presence: true

  belongs_to :author, class_name: "User"
  belongs_to :sub
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  validate :url_should_be_accessible


  def karma
    votes.select {|vote| vote.upvote}.count -
    votes.select {|vote| !vote.upvote}.count
  end

  def shortened_url
    bitly = Bitly.new("o_2ujfanh8et", "R_0c6018b656c14658845af89e00d7b803")
    bitly.shorten(url)
  end

  def url_should_be_accessible
    require 'net/http'
    success = true
    begin
      success = false unless Net::HTTP.get_response(URI.parse(self.url)).is_a?(Net::HTTPSuccess)
    rescue
      success = false
    end
    errors.add(:url, 'cannot be accessed in Internet') unless success
  end

end
