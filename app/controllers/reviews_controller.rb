class ReviewsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create 
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)

    @review.user = current_user

    if @review.save
      redirect_to movie_path(@movie)
    else 
      render action: 'new'
    end
  end

    private
    def review_params

      params.require(:review).permit(:body, :rating, :movie_id, :user_id, :vote_count)

    end
end
