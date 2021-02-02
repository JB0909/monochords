class WishesController < ApplicationController
    def index
        @user = User.find(params[:id])
        @wishes = @user.wishes.all
    end

    def create
        @user = current_user
        @music = Music.find(params[:music_id])
        @wish = Wish.create(user_id: @user.id, music_id: @music.id)
        @detail = params[:music_id]
        if Practicing.where(user_id: current_user, music_id: @detail).exists?
            Practicing.find_by(user_id: current_user, music_id: @detail).destroy
        end
        if Practiced.where(user_id: current_user, music_id: @detail).exists?
            Practiced.find_by(user_id: current_user, music_id: @detail).destroy
        end
        redirect_to root_path
    end
    
    def destroy
        @user = current_user
        @music = Music.find(params[:music_id])
        @wish = Wish.find_by(user_id: @user.id, music_id: @music.id)
        @wish.destroy
        redirect_to root_path
    end
end
