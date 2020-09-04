class FollowController < ApplicationController
    include(FollowHelper)
    def index
        @following = current_user.following_users
        @followers = current_user.followers
    end

    def follow_user
        follow_aim_user = User.find(params[:follow_id])

        if current_user.follow(follow_aim_user)
            flash[:success] = 'You have followed'
            basic_redirect
        else
            flash[:danger] = 'You have not followed'
            basic_redirect
        end
    end

    def unfollow_user
        unfollow_aim_user = User.find(params[:unfollow_id])

        if current_user.stop_following(unfollow_aim_user)
            flash[:success] = "You have unfollowed"
            basic_redirect
        else
            flash[:danger] = "something goes wrong"
            basic_redirect
        end
    end




end