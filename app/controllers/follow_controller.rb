class FollowController < ApplicationController
    include(FollowHelper)
    before_action :user_signed_in?
    before_action :redirect_if_not_log_in
    def index
        @following = current_user.following_users.paginate(page: params[:page], per_page: 10)
        @followers = current_user.followers
    end

    def follow_user
        follow_aim_user = User.find(params[:follow_id])

        if current_user.follow(follow_aim_user)
            flash[:success] = 'You have followed'
            basic_redirect
        end
    end

    def unfollow_user
        unfollow_aim_user = User.find(params[:unfollow_id])

        if current_user.stop_following(unfollow_aim_user)
            flash[:success] = "You have unfollowed"
            basic_redirect
        end
    end




end