class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    
  end

  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        flash[:success] = 'Post created'
        redirect_to posts_path
      else
        render 'new'
      end
  end

  

  private

  def post_params
    params.require(:post).permit(:title, :image)
  end

  

end
