class RecordsController < ApplicationController
    def show
        @record = Record.find(params[:id])
        @record_comment = Comment.where(record_id: [@record])
        if user_signed_in?
            @comment = current_user.comments.build
        end
    end
    def create
        @user = current_user
        @following_records = Record.where(user_id: [current_user.id, *current_user.following_ids])
        @comment = current_user.comments.build
        @music = Practicing.find(record_params[:practicing_id])
        @record = Record.create(body: record_params[:body], user_id: @user.id, practicing_id: record_params[:practicing_id], time: record_params[:time], time_minutes: record_params[:time_minutes], song_name: @music.song_name, artist_name: @music.artist_name, music_id: @music.music_id, image_url: @music.image_url)
    end

    def destroy
        if user_signed_in?
            @records = Record.where(user_id: [current_user.id])
            @following_records = Record.where(user_id: [current_user.id, *current_user.following_ids])
            @comment = current_user.comments.build
            @record = Record.find(params[:id])
            @record.destroy
        end
    end

    private
    def record_params
        params.require(:record).permit(:body, :practicing_id, :time, :time_minutes)
    end
end
