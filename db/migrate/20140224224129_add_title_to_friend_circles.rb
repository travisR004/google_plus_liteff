class AddTitleToFriendCircles < ActiveRecord::Migration
  def change
    add_column :friend_circles, :title, :string
  end
end
