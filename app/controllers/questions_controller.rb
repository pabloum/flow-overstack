class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    if question.save
      redirect_to questions_path, notice: "The question was succesfully saved"
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    if question.update(question_params)
      redirect_to questions_path, notice: "The question was succesfully edited"
    else
      render :new
    end
  end

  def destroy
    # Question.find(params[:id]).votes.destroy_all
    # Question.find(params[:id]).comments.destroy_all
    question = Question.find(params[:id])
    question.destroy

    redirect_to questions_path, notice: "Question succesfully deleted"
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
