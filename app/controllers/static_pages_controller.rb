class StaticPagesController < ApplicationController
    def home
        if user_signed_in?
            @following_microposts = Micropost.where(user_id: [current_user.id, *current_user.following_ids])
            @following_reviews = Review.where(user_id: [current_user.id, *current_user.following_ids])
            @following_records = Record.where(user_id: [current_user.id, *current_user.following_ids])
            @comment = current_user.comments.build

            #profile(side_colmun)
            @user  = current_user
            @first = @user.practiceds.all[0]
            if @first == nil
                @average = 0
            else
                @average = Date.today - Date.parse(@first['created_at'].to_s)
                @first_regi = @first['created_at']
            end
            @practice_time = @user.records.all.sum(:time)
            @create = Date.parse(@user["created_at"].to_s)
            @difference = Date.today - @create
        end
    end
end
