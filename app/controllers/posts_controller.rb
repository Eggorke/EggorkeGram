# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :user_signed_in?
  before_action :redirect_if_not_log_in
  before_action :create_editor

  def index
    @posts = @post_editor.index(current_user).paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = @post_editor.show
  end

  def edit
    @post = @post_editor.show
    unless current_user.id == @post.user_id
      redirect_to root_path
      flash[:alert] = 'Do not try to edit not yours posts!'
    end
  end

  def update
    if @post_editor.update(post_params)
      flash[:success] = 'Post was updated'
      redirect_to root_path
    else
      flash[:danger] = 'Post didnt update'
      redirect_to root_path
    end
  end

  def new
    @post = Post.new
  end

  def create
    if PostCreator.new(post_params, current_user).create_post
      flash[:success] = 'Post created'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post_editor.destroy
    flash[:success] = 'Post deleted'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :comment)
  end

  def create_editor
    @post_editor = PostEditor.new(params[:id])
  end
end
