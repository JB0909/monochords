class UsersController < ApplicationController
  require 'date'
  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @comment = current_user.comments.build
      #プロフィール
      @practicing = current_user.practicings.all
      #コメント投稿
      @comment = current_user.comments.build
    end

    #投稿一覧
    @microposts = @user.microposts.all.page(params[:page]).without_count.per(12)
    
    ##profile(side_colmun)
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


    #グラフ
    @artist_groups = @user.practiceds.all.group(:artist_name).order("count_artist_name DESC").count(:artist_name)
    @artistline = Array.new
    @artist_groups.each do |artist|
      @artistline.push(artist[0])
    end
    @countline = Array.new
    @artist_groups.each do |count|
      @countline.push(count[1])
    end

  end

  def edit
    @user = User.find_by(:id => params[:id])
    if @user.id == current_user.id
      render "edit"
    else
      redirect_to root_url
    end
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to user_path(current_user.id)
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end  
    else
      redirect_to root_url
    end
  end

  def following
      #@userがフォローしているユーザー
      @user  = User.find(params[:id])
      @users = @user.following
      #profile(side_colmun)
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
      #render
      render 'show_follow'
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    #profile(side_colmun)
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
    #render
    render 'show_follower'
  end
end

private

def user_params
  params.require(:user).permit(:username, :profile_image, :sex, :sex_status, :blood, :blood_status, :add, :add_status, :birth_date, :birth_date_status, :history_date, :history_date_status, :introduction)
end