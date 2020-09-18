class CommentariesController < ApplicationController
    before_action :user_signed_in?
    before_action :redirect_if_not_log_in
    def create
        @commentary = current_user.commentary.build(comment_params)
        if @commentary.save
            redirect_to posts_path
            flash[:success] = 'Commentary was added'
        end
    end

    #def show
    #    @commentary = Commentary.all(params[post_id])
    #end

    private

    def comment_params
        params.require(:commentary).permit(:commentary_text, :post_id, :user_id)
    end


end

