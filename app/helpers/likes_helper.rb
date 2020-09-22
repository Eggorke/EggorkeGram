# frozen_string_literal: true

module LikesHelper
  def post_already_liked(post)
    aim = Like.find_by(post_id: post.id, user_id: current_user.id)

    if aim
      false
    else
      true
    end
  end
end
