# frozen_string_literal: true

module ApplicationHelper
  def ten_random_users
    offset = User.order('RANDOM()').limit(11)
    offset
  end
end
