class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @micropost = current_user.microposts.build
      @microposts = current_user.microposts.all
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