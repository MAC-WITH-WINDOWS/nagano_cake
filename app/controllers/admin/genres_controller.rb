class Admin::GenresController < ApplicationController












  def edit
    @genre = Genre.find_by(params[:id])
  end

  def update
    @genre = Genre.find_by(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private


end
