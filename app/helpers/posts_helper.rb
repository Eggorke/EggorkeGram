module PostsHelper
  def total_likes(post)
    total_likes = Like.where(post_id: post.id).count
  end
end
