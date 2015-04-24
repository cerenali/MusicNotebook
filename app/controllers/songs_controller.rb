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
    type = params[:type]
    @song = Song.find(params[:id])
    if type == "favorite"
      current_user.favorites << @song
      redirect_to :back, notice: "You favorited #{@song.title} by #{@song.artist}"
    elsif type == "unfavorite"
      current_user.favorites.delete(@song)
      redirect_to :back, notice: "You unfavorited #{@song.title} by #{@song.artist}"
    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :tag_list)
  end
end
