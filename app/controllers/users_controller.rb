# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user_signed_in?
  before_action :redirect_if_not_log_in
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)

    redirect_to root_path if @user.id == current_user.id
  end
end
