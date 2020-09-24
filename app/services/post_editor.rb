# frozen_string_literal: true

class PostEditor
  def initialize(params)
    @post_id = params
  end

  def show
    post = Post.find(@post_id)
  end

  def destroy
    Post.find(@post_id).destroy
  end

  def update(post_params)
    post = Post.find(@post_id)
    post.update(post_params) ? TRUE : false
  end

  def index(current_user)
    feed_aim_ids = current_user.following_users.ids
    feed_aim_ids.push(current_user.id)
    Post.where(user_id: feed_aim_ids)
  end
end
