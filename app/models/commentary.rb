# frozen_string_literal: true

class Commentary < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :commentary_text, presence: true, length: { maximum: 200 }
end
