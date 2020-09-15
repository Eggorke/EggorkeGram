class IndexController < ApplicationController
  before_action :user_signed_in?
  
  def home
    
    @posts = Post.where(user_id: current_user.id)
    
  end

  
end
