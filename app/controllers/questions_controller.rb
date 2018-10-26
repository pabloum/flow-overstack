class QuestionsController < ApplicationController
  before_action :private_access, except: [:index, :show]

  def index
    @questions = Question.all
    if params[:concept].present?
      @questions = @questions.where("title LIKE ? OR description LIKE ?", "%#{params[:concept]}%", "%#{params[:concept]}%")
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
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
    if @question.user != current_user
      redirect_to :login
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path, notice: "The question was succesfully edited"
    else
      render :new
    end
  end

  def destroy
    # Question.find(params[:id]).votes.destroy_all
    question = Question.find(params[:id])
    question.comments.destroy_all
    question.answers.destroy_all
    question.destroy

    redirect_to questions_path, notice: "Question succesfully deleted"
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
