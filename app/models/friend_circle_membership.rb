# == Schema Information
#
# Table name: friend_circle_memberships
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  friend_circle_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class FriendCircleMembership < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend_circle
end
