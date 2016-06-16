
class User < ActiveRecord::Base

  validates :username, :email, presence: true, uniqueness: true
  validates :hashed_password, presence: true
  validate :password_present?

  has_many :subs, foreign_key: :moderator_id

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    return @user if @user && @user.password == password
    nil
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  private
  def password_blank?
    password == ""
  end

  def password_present?
    if password_blank?
      errors.add :password, 'cannot be blank.'
    end
  end

end
