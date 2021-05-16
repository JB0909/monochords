class ReviewsController < ApplicationController
    def show
        @review = Review.find(params[:id])
        @review_comment = Comment.where(review_id: [@review])
        if user_signed_in?
            @comment = current_user.comments.build
        end
    end

    def create
        @user = current_user
        @music = Music.find(params[:music_id])
        @review = Review.create(content: review_params[:content], user_id: @user.id, music_id: @music.id)
        @reviews = Review.where(music_id: [@music])
    end

    def destroy
        @music = Music.find(params[:music_id])
        @reviews = Review.where(music_id: [@music])
        @show_reviews = Review.where(user_id: [current_user.id])
        @following_reviews = Review.where(user_id: [current_user.id, *current_user.following_ids])
        @comment = current_user.comments.build
        @review = Review.find(params[:id])
        @review.destroy
    end

    private
    def review_params
        params.require(:review).permit(:content)
    end
end
