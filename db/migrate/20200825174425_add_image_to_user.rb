# frozen_string_literal: true

class AddImageToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image_data, :text
  end
end
