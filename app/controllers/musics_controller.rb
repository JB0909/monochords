class MusicsController < ApplicationController
    def show
        if user_signed_in?
            #コメント投稿
            @comment = current_user.comments.build
            @user  = current_user
        end
        @music = Music.find(params[:id])
        @review = Review.new(music_id: @music)
        @reviews = Review.where(music_id: [@music]).page(params[:page]).without_count.per(12)
    end

    def create
        @music = params[:detail]
        @musics = Music.create(music_params)
        redirect_to music_path(@musics)
    end

    private
    def music_params
        params.require(:detail).permit(:album_name, :artist_name, :image_url, :song_name, :external_id, :id)
    end
end
