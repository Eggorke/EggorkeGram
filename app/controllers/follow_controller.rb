class FollowController < ApplicationController
    
    def index
        @following = current_user.following_users
        @followers = current_user.followers
    end

    def follow_user
        follow_aim_user = User.find(params[:follow_id])

        if current_user.follow(follow_aim_user)
            flash[:success] = 'You have followed'
            redirect_to request.referer
        else
            flash[:danger] = 'You have not followed'
            redirect_to request.referer
        end
    end

    def unfollow_user
        unfollow_aim_user = User.find(params[:unfollow_id])

        if current_user.stop_following(unfollow_aim_user)
            flash[:success] = "You have unfollowed"
            redirect_to request.referer
        else
            flash[:danger] = "something goes wrong"
            redirect_to request.referer
        end
    end




end