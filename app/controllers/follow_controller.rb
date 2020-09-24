# frozen_string_literal: true

class FollowController < ApplicationController
  include(FollowHelper)
  before_action :user_signed_in?
  before_action :redirect_if_not_log_in
  before_action :create_manager
  def index
    @following = @manager.get_followings.paginate(page: params[:page], per_page: 10)
    @followers = @manager.get_followers
  end

  def follow_user
    if @manager.follow(params[:follow_id])
      flash[:success] = 'You have followed'
      basic_redirect
    end
  end

  def unfollow_user
    if @manager.unfollow(params[:unfollow_id])
      flash[:success] = 'You have unfollowed'
      basic_redirect
    end
  end

  private

  def create_manager
    @manager = FollowManager.new(current_user)
  end
end
