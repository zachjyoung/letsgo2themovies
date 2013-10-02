class MoviesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.all 
  end
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = Review.where(movie_id: @movie.id)
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :year, :description, :director, :cast)
  end
end
