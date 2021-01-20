class StaticPagesController < ApplicationController
    def home
        @following_microposts = Micropost.where(user_id: [current_user.id, *current_user.following_ids])
    end
end
