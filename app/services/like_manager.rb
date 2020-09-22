# frozen_string_literal: true

class LikeManager
  def initialize(like_params)
    @like_params = like_params
  end

  def put_like
    @like = Like.new(@like_params)
    @like.save ? TRUE : false
  end

  def put_unlike
    @unlike = Like.find_by(@like_params)
    @unlike.destroy ? TRUE : false
  end
end
