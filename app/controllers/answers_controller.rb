class AnswersController < ApplicationController
  before_action :private_access

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answers_params)
    if @answer.save
      redirect_to @question
    else
      @error_ans = "Answer can't be blank"
      render 'questions/show'
    end

  end

  private
    def answers_params
      params.require(:answer).permit(:content).merge(user: current_user)
    end
end
