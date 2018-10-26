class VotesController < ApplicationController

  def create
    vote = Vote.new(votes_params)
    vote.user = current_user
    vote.save

    if vote.votable_type == "Question"
      redirect_back(fallback_location: root_path)
    else
      redirect_to Question.find(vote.votable.question_id)
    end
  end

  def destroy
    @vote = Vote.find(params[:id][0].to_i)
    vote = @vote
    if vote.user == current_user
      vote.destroy
    end

    if @vote.votable_type == "Question"
      redirect_back(fallback_location: root_path)
    else
      redirect_to Question.find(vote.votable.question_id)
    end

  end

  private
    def votes_params
      params.require(:vote).permit(:votable_type, :votable_id).merge(user: current_user)
    end
end
