class AnswersController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    question.answers.create(answers_params)

    redirect_to question
  end

  private
    def answers_params
      params.require(:answer).permit(:content)
    end
end
