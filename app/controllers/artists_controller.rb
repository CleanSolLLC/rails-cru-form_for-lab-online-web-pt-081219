class ArtistsController < ApplicationController

  def new
  	@artist = Artist.new
  end

  def create
  	@artist = Artist.new
  	# @artist.name = params[:artist][:name]
  	# @artist.bio = params[:artist][:bio]
  	@artist = Artist.create(artist_params(:name, :bio))
  	redirect_to artist_path(@artist)
  end

  def edit
  	@artist = find_artist
  end

  def update
  	@artist = find_artist
  	@artist.update(artist_params(:name, :bio))
  	redirect_to artist_path(@artist)
  end

  def show
  	@artist = find_artist
  end

  private
  	def find_artist
  	  Artist.find(params[:id])
  	end

  	def artist_params(*args)
  		params.require(:artist).permit(*args)
	end
end
