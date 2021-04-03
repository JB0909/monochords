class CommentsController < ApplicationController
    def create
        @user = current_user
        @comment = Comment.create(content: comment_params[:content], user_id: @user.id, micropost_id: comment_params[:micropost_id], record_id: comment_params[:record_id], review_id: comment_params[:review_id])
        @record_comment = Comment.where(record_id: comment_params[:record_id])
        @review_comment = Comment.where(review_id: comment_params[:review_id])
        @micropost_comment = Comment.where(micropost_id: comment_params[:micropost_id])
        if comment_params[:micropost_id].present?
            @micropost = Micropost.find(comment_params[:micropost_id])
        elsif comment_params[:record_id].present?
            @record = Record.find(comment_params[:record_id])
        elsif comment_params[:review_id].present?
            @review = Review.find(comment_params[:review_id])
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :micropost_id, :record_id, :review_id)
    end
end
