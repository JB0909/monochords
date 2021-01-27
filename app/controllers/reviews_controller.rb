class ReviewsController < ApplicationController
    def create
        @user = current_user
        @music = Music.find(params[:music_id])
        @review = Review.create(content: review_params[:content], user_id: @user.id, music_id: @music.id)
        @reviews = Review.where(music_id: [@music])
    end

    private
    def review_params
        params.require(:review).permit(:content)
    end
end
