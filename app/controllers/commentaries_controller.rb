class CommentariesController < ApplicationController

    def create
        @commentary = Commentary.new(comment_params)
        if @commentary.save
            redirect_to posts_path
            flash[:success] = 'Commentary was added'
        else
            redirect_to posts_path
            flash[:danger] = 'Commentary has not been added'
        end
    end

    def show
        @commentary = Commentary.all(params[post_id])
    end

    private

    def comment_params
        params.require(:commentary).permit(:commentary_text, :post_id, :user_id)
    end


end
