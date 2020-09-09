class AddIndexesToLikes < ActiveRecord::Migration[6.0]
  def change
    add_index :likes, ["user_id", "post_id"], name: "likes_index", unique: true
  end
end
