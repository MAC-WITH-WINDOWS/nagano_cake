class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
    @genres = Genre.page(params[:page])
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to request.referrer
  end


  def edit
    @genre = Genre.find_by(params[:id])
  end

  def update
    @genre = Genre.find_by(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end


  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
