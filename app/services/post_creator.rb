# frozen_string_literal: true

class PostCreator
  def initialize(post_params, current_user)
    @post_params = post_params
    @current_user = current_user
  end

  def create_post
    @post = @current_user.posts.build(@post_params)
    @post.save ? TRUE : false
  end
end
