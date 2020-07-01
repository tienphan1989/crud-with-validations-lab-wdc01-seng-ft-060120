class SongsController < ApplicationController

    #before_action :find_song, only: [:show, :edit, :update, :destroy, :create]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        #@song = Song.find(params[:id])
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song.id)
        else
            render :new
        end
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song.id)
        else
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end

  private

    def song_params
        params.require(:song).permit(:released, :release_year, :artist_name, :genre, :title)
    end

end
