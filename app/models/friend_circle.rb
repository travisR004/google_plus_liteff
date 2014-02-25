# == Schema Information
#
# Table name: friend_circles
#
#  id         :integer          not null, primary key
#  creator_id :integer
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#

class FriendCircle < ActiveRecord::Base
  validates :creator_id, :title, presence: true
  belongs_to :creator, class_name: "User"
  has_many :friend_circle_memberships
  has_many :users, through: :friend_circle_memberships
  has_many :post_shares
  has_many :posts, :through => :post_shares

end
