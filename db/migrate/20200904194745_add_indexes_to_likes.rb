# frozen_string_literal: true

class AddIndexesToLikes < ActiveRecord::Migration[6.0]
  def change
    add_index :likes, %w[user_id post_id], name: 'likes_index', unique: true
  end
end
