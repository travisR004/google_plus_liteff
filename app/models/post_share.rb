# == Schema Information
#
# Table name: post_shares
#
#  id               :integer          not null, primary key
#  post_id          :integer
#  friend_circle_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class PostShare < ActiveRecord::Base
  validates :friend_circle_id, :presence => true
  validates :post, :presence => true

  belongs_to :post, :inverse_of => :post_shares
  belongs_to :friend_circle
end
