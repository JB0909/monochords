class StaticPagesController < ApplicationController
    def home
        if user_signed_in?
            @following_microposts = Micropost.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).without_count.per(2)
            @following_reviews = Review.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).without_count.per(2)
            @following_records = Record.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).without_count.per(2)
            #コメント投稿
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
            #年齢
            if @user.birth_date.nil?
            else
                @birth_date = Date.parse(@user["birth_date"].to_s)
                @age = (Date.today.strftime("%Y%m%d").to_i - @birth_date.strftime("%Y%m%d").to_i)/10000
            end
            #ギター
            if @user.history_date.nil?
            else
                #ギター開始日
                @start_date = Date.parse(@user["history_date"].to_s)
                #ギター歴
                @history_date = Date.parse(@user["history_date"].to_s)
                @today = Date.today
                @today -= @history_date - Date.new( @history_date.year, @history_date.month, 1)
                @diff_months = @today.year * 12 + @today.month - @history_date.year * 12 - @history_date.month
                @diff_years = @diff_months / 12
                @diff_months -= @diff_years * 12
                @diff_days = @today.day - 1
            end
            case params[:type]
            when 'micropost', 'record', 'review'
                render "static_pages/#{params[:type]}"
            end
        end
    end
end
