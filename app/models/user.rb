# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)
#  password_digest  :string(255)
#  session_token    :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  reset_token      :string(255)
#  friend_circle_id :integer
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :password_digest, presence: true
  validates :password, presence: true, on: :create
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :email, presence: true, uniqueness: true
  validates :session_token, presence: true
  before_validation :ensure_session_token

  has_many :friend_circles, foreign_key: :creator_id
  has_many :friend_circle_memberships
  has_many :friend_circles_apart_of, through: :friend_circle_memberships, source: :friend_circle
  has_many :posts, :inverse_of => :user
  has_many :upvotes


  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_reset_token!
    self.reset_token = self.class.generate_session_token
    self.save!
    self.reset_token
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(pt)
  end

  def is_password?(pt)
    BCrypt::Password.new(self.password_digest).is_password?(pt)
  end

  def self.find_by_credentials(params)
    user = User.find_by(email: params[:email])
    user.try(:is_password?, params[:password]) ? user : nil
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
