class PracticingsController < ApplicationController
    def index
        @user = User.find(params[:id])
        @practicings = @user.practicings.all
    end

    def create
        @user = current_user
        @music = Music.find(params[:music_id])
        @practicing = Practicing.create(user_id: @user.id, music_id: @music.id, song_name: @music.song_name, artist_name: @music.artist_name, image_url: @music.image_url)
        @detail = params[:music_id]
        if Wish.where(user_id: current_user, music_id: @detail).exists?
            Wish.find_by(user_id: current_user, music_id: @detail).destroy
        end
        if Practiced.where(user_id: current_user, music_id: @detail).exists?
            Practiced.find_by(user_id: current_user, music_id: @detail).destroy
        end
        redirect_to root_path
    end
    
    def destroy
        @user = current_user
        @music = Music.find(params[:music_id])
        @practicing = Practicing.find_by(user_id: @user.id, music_id: @music.id)
        @practicing.destroy
        redirect_to root_path
    end
end
