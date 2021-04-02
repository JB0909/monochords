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
        @music = Practicing.find(record_params[:practicing_id])
        @record = Record.create(body: record_params[:body], user_id: @user.id, practicing_id: record_params[:practicing_id], time: record_params[:time], song_name: @music.song_name, artist_name: @music.artist_name, music_id: @music.music_id, image_url: @music.image_url)
        redirect_to root_path
    end

    def destroy
    end

    private
    def record_params
        params.require(:record).permit(:body, :practicing_id, :time)
    end
end
