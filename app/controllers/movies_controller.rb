class MoviesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.where(state: "submitted")
  end
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else 
      render action: 'new'
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @vote = Vote.new
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.submit
    redirect_to movie_path(@movie)
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :year, :description, :director, :cast, :image)
  end
end
