class StaticPagesController < ApplicationController
    def home
        @following_microposts = Micropost.where(user_id: [current_user.id, *current_user.following_ids])
        @following_reviews = Review.where(user_id: [current_user.id, *current_user.following_ids])
        @following_records = Record.where(user_id: [current_user.id, *current_user.following_ids])
        @comment = current_user.comments.build
    end
end
