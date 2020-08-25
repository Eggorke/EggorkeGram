class IndexController < ApplicationController
  def home
    @posts = Post.all
  end

  
end
