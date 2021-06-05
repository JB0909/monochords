class StaticPagesController < ApplicationController
    def home
        if user_signed_in?
            @following_microposts = Micropost.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).without_count.per(12)
            @following_reviews = Review.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).without_count.per(12)
            @following_records = Record.where(user_id: [current_user.id, *current_user.following_ids]).page(params[:page]).without_count.per(12)
            #コメント投稿
            @comment = current_user.comments.build
            #つぶやき投稿
            @micropost = current_user.microposts.build
            #練習記録
            @record = current_user.records.build
            @practicing = current_user.practicings.all
            #profile(side_colmun)
            @user  = current_user
            @first = @user.practiceds.all[0]
            if @first == nil
                @average = 0
            else
                @average = Date.today - Date.parse(@first['created_at'].to_s)
                @first_regi = @first['created_at']
            end
            #総練習時間
            @hour = ((@user.records.all.sum(:time)*60) + (@user.records.all.sum(:time_minutes)))/60
            @minutes = ((@user.records.all.sum(:time)*60) + (@user.records.all.sum(:time_minutes))) - (@hour * 60)
            
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

    def resource_name
        :user
    end
    
    def resource
        @resource ||= User.new
    end
    
    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end

    def guest_sign_in
        user = User.find_or_create_by(email: 'guest@example.com') do |user|
            user.username = "ゲスト"
            user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
            user.confirmed_at = Time.now
        end
        sign_in user
        redirect_to root_path
    end
end
