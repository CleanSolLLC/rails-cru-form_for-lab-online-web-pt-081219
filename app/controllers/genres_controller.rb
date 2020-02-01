class GenresController < ApplicationController
  
  def new
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new
  	@genre = Genre.create(genre_params(:name))
  	redirect_to genre_path(@genre)
  end

  def edit
  	@genre = find_genre
  end

  def update
  	@genre = find_genre
  	@genre = Genre.update(genre_params(:name))
  	redirect_to genre_path(@genre)
  end

  def show
  	@genre = find_genre
  end

  private

    def genre_params(*args)
      params.require(:genre).permit(*args)
    end

    def find_genre
    	Genre.find(params[:id])
    end

end
