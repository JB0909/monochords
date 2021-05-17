class SearchsController < ApplicationController
    require 'rspotify'
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

    def search
        #@tracks = Track.all
        if user_signed_in?
            @user  = current_user
        end
        if params[:search].present?
            @s_tracks = RSpotify::Track.search(params[:search])
        end

    end

    def show
        @music = Music.find(params[:id])
    end

    def create
        @music = params[:detail]
        @music = Music.create(search_params)
        redirect_to song_path(@music.id)
    end

    private
    def search_params
        params.require(:detail).permit(:album_name, :artist_name, :image_url, :song_name, :external_id)
    end
end
