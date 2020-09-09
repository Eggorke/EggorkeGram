class UsersController < ApplicationController
    before_action :user_signed_in?
    def show
        @user = User.find(params[:id])
        @posts = Post.where(user_id: @user.id)
        
        if @user.id == current_user.id
            redirect_to root_path
        end
    end
end