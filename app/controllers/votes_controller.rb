class VotesController < ApplicationController
  before_filter :load_voteable

  def create
    @vote = @voteable.votes.new(vote_params)
    @vote.user = current_user
    @movie = @voteable.movie
  
    if @vote.save
      redirect_to movie_path(@movie)
    else
      flash[:notice] = "You can only vote once in either direction." 
      render template: "movies/show"
    end

  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end

  def load_voteable
    klass = [Review].detect { |c| params["#{c.name.underscore}_id"] }
    @voteable = klass.find(params["#{klass.name.underscore}_id"])
  end

end