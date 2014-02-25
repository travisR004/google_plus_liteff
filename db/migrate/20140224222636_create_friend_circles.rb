class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.integer :creator_id

      t.timestamps
    end
  end
end
