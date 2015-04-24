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
    # @songs = Song.all
    if params[:tag]
      @songs = Song.tagged_with(params[:tag]).order(:artist)
    else
      @songs = Song.order(:artist)
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
    if @song.update_attributes(song_params)
      redirect_to song_path(@song.id)
    else
      render 'edit'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  def tagged
    if params[:tag].present? 
      @songs = Song.tagged_with(params[:tag])
    else 
      @songs = Song.all
    end  
  end

  def favorite
    @song = Song.find(params[:id])
    if current_user.favorites.include? @song
      current_user.favorites.delete(@song)
    else
      current_user.favorites << @song
    end
    redirect_to :back
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :tag_list)
  end
end
