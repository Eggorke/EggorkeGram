# frozen_string_literal: true

module ApplicationHelper
  def ten_random_users
    ignoring_ids = []
    ignoring_ids.push(current_user.id)
    @preset = current_user.following_users
    @preset.each do |u|
      ignoring_ids.push(u.id)
    end
    offset = User.where.not(id: ignoring_ids).order('RANDOM()').limit(11)
    return offset
  end
end
