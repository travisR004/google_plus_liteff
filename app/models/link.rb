# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  validates :url, :presence => true
  validates :post, :presence => true

  belongs_to :post, inverse_of: :links

end
