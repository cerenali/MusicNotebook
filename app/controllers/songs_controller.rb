class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
    else
      render 'new'
    end
  end

  def index
    @songs = Song.all
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
