module LikesHelper

  def post_already_liked(post)
    aim = Like.find_by(post_id: post.id, user_id: current_user.id)

    if aim
      return false
    else
      return true
    end
        
  end

end
