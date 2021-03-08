class UsersController < ApplicationController
  require 'date'
  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @micropost = current_user.microposts.build
      @record = current_user.records.build
      @comment = current_user.comments.build
      #プロフィール
      @practicing = current_user.practicings.all
    end

    #投稿一覧
    @microposts = @user.microposts.all
    
    #プロフィール
    @first = @user.practiceds.all[0]
    if @first == nil
      @average = nil
    else
      @average = Date.today - Date.parse(@first['created_at'].to_s)
    end

    @practice_time = @user.records.all.sum(:time)
    @create = Date.parse(@user["created_at"].to_s)
    @difference = Date.today - @create

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
      render 'show_follow'
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end

private

def user_params
  params.require(:user).permit(:profile_image)
end