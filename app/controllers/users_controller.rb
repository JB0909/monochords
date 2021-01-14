class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @micropost = current_user.microposts.build
      @microposts = current_user.microposts.all
    end
  end

  def edit  
  end

  def index
    @users = User.all
  end

  def update
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
