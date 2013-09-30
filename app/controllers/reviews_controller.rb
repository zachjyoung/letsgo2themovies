class ReviewsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end
  def create 
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)

    if @review.save
      redirect_to movie_path(@movie)
    end
  end

    private
    def review_params
      params.require(:review).permit(:body, :rating, :movie_id)
    end
end
