# frozen_string_literal: true

class FollowManager
  def initialize(current_user)
    @current_user = current_user
  end

  def get_followings
    @current_user.following_users
  end

  def get_followers
    @current_user.followers
  end

  def follow(params)
    @current_user.follow(User.find(params)) ? TRUE : false
  end

  def unfollow(params)
    @current_user.stop_following(User.find(params)) ? TRUE : false
  end
end
