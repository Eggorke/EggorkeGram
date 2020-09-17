class IndexController < ApplicationController

  
  def home
    if user_signed_in?
      @posts = Post.where(user_id: current_user.id)
    end
  end

  
end
