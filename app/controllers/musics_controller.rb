class MusicsController < ApplicationController
    def show
        @music = Music.find(params[:id])
        @review = Review.new(music_id: @music)
        @reviews = Review.where(music_id: [@music])
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
