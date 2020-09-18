class PostsController < ApplicationController
  before_action :user_signed_in?
  
  def index
    if current_user.all_following
      feed_aim_ids = current_user.following_users.ids
      feed_aim_ids.push(current_user.id)
      @posts = Post.where(user_id: feed_aim_ids).paginate(page: params[:page], per_page: 10)
    else
      @posts = nil
    end
  end


  def show
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      redirect_to root_path
      flash[:alert] = "Do not try to edit not yours posts!"
    end
  
  end
  

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    flash[:success] = 'Post was updated'
    redirect_to post
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

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = 'Post deleted'
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :image, :comment)
  end

  

end
