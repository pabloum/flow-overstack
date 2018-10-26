class CommentsController < ApplicationController
  def create
    comment = Comment.new(comments_params)
    comment.user = current_user

    @question = nil

    if comment.commentable_type == "Question"
      @question = Question.find(comment.commentable.id)
    else
      @question = Question.find(comment.commentable.question_id)
    end

    if comment.save
      redirect_to @question
    else
      redirect_to controller: 'questions', action: 'show', id: @question.id, error_comment: "Comment can't be blank"
    end

  end

  private
    def comments_params
      params.require(:comment).permit(:text, :commentable_type, :commentable_id).merge(user: current_user)
    end
end
