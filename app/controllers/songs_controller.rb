class SongsController < ApplicationController

  def index
  	@songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new
    @song = Song.create(params.require(:song).permit(:name, :artist_id, :genre_id))
  	redirect_to song_path(@song)
  end

  def edit
  	@song = find_song
  end

  def update
  	@song = find_song
  	@song = Song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
  	redirect_to song_path(@song) 
  end

  def show
  	@song = find_song
  end

  private
 
    def find_song
      Song.find(params[:id])
    end

end
