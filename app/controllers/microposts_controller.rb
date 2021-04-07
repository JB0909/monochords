class MicropostsController < ApplicationController
    def show
        @micropost = Micropost.find(params[:id])
        @micropost_comment = Comment.where(micropost_id: [@micropost])
        if user_signed_in?
            @comment = current_user.comments.build
        end
    end
    def create
        if user_signed_in?
            @micropost = current_user.microposts.build(micropost_params)
            @following_microposts = Micropost.where(user_id: [current_user.id, *current_user.following_ids])
            @comment = current_user.comments.build
        end
        if @micropost.save
        else
            @microposts = current_user.microposts.order('created_at DESC')
        end
        @microposts = current_user.microposts.all
    end

    def destroy
        if user_signed_in?
            @following_microposts = Micropost.where(user_id: [current_user.id, *current_user.following_ids])
            @comment = current_user.comments.build
            @micropost = Micropost.find(params[:id])
            @micropost.destroy
        end
    end

    private
    def micropost_params
        params.require(:micropost).permit(:body)
    end
end
