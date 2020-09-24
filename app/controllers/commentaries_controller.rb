# frozen_string_literal: true

class CommentariesController < ApplicationController
  before_action :user_signed_in?
  before_action :redirect_if_not_log_in
  before_action :create_manager
  def create
    if @commentary_manager.create
      redirect_to posts_path
      flash[:success] = 'Commentary was added'
    end
  end

  private

  def comment_params
    params.require(:commentary).permit(:commentary_text, :post_id, :user_id)
  end

  def create_manager
    @commentary_manager = CommentaryManager.new(current_user, comment_params)
  end
end
