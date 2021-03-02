class PracticedsController < ApplicationController
    def index
        @user = User.find(params[:id])
        @practiceds = @user.practiceds.all
    end

    def create
        @user = current_user
        @music = Music.find(params[:music_id])
        @wanna = Practiced.create(user_id: @user.id, music_id: @music.id, artist_name: @music.artist_name)
        @detail = params[:music_id]
        if Wish.where(user_id: current_user, music_id: @detail).exists?
            Wish.find_by(user_id: current_user, music_id: @detail).destroy
        end
        if Practicing.where(user_id: current_user, music_id: @detail).exists?
            Practicing.find_by(user_id: current_user, music_id: @detail).destroy
        end
        redirect_to root_path
    end
    
    def destroy
        @user = current_user
        @music = Music.find(params[:music_id])
        @practiced = Practiced.find_by(user_id: @user.id, music_id: @music.id)
        @practiced.destroy
        redirect_to root_path
    end
end
