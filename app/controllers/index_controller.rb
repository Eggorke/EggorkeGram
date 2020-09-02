class IndexController < ApplicationController
  before_action :user_signed_in?
  def home
    if user_signed_in?
      @posts = Post.where(user_id: current_user.id)
    end
  end

  
end
