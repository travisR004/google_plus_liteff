# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :title, :body, :presence => true
  validates :user, :presence => true

  belongs_to :user, :inverse_of => :posts
  has_many :links, inverse_of: :post
  has_many :post_shares, :inverse_of => :post
  has_many :friend_circles, :through => :post_shares
  has_many :upvotes
end
