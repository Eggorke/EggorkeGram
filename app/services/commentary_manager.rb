# frozen_string_literal: true

class CommentaryManager
  def initialize(current_user, comment_params)
    @current_user = current_user
    @comment_params = comment_params
  end

  def create
    @current_user.commentary.build(@comment_params).save ? TRUE : false
  end
end
