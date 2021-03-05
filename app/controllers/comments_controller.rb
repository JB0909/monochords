class CommentsController < ApplicationController
    def create
        @user = current_user
        @comment = Comment.create(content: comment_params[:content], user_id: @user.id, micropost_id: comment_params[:micropost_id], record_id: comment_params[:record_id], review_id: comment_params[:review_id])
        redirect_to root_path
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :micropost_id, :record_id, :review_id)
    end
end
