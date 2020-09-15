class LikesController < ApplicationController
    include(FollowHelper) #it allows to to basic_redirect that means redirect to page which send response
    before_action :user_signed_in?

    def like
        
        @like = Like.new(like_params)
        
        if @like.save
            flash[:success] = "You like it"
            basic_redirect 
        end
    end



    def unlike
        Like.find_by(like_params).destroy
        basic_redirect
        flash[:danger] = "You have disliked it"
    end

    private

    def like_params
        params.permit(:user_id, :post_id)
    end

end

