class IndexController < ApplicationController

  
  def home
    
    @posts = Post.where(user_id: current_user.id)
    
  end

  
end
