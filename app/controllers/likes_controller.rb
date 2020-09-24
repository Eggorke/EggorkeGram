# frozen_string_literal: true

class LikesController < ApplicationController
  include(FollowHelper) # it allows to to basic_redirect that means redirect to page which send response
  before_action :user_signed_in?
  before_action :create_manager

  def like
    if @like_manager.put_like
      flash[:success] = 'You like it'
      basic_redirect
    end
  end

  def unlike
    if @like_manager.put_unlike
      basic_redirect
      flash[:danger] = 'You have disliked it'
    end
  end

  private

  def like_params
    params.permit(:user_id, :post_id)
  end

  def create_manager
    @like_manager = LikeManager.new(like_params)
  end
end
