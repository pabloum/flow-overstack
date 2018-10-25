class CommentsController < ApplicationController
  def create
    comment = Comment.new(comments_params)
    comment.user = current_user
    comment.save

    if comment.commentable_type == "Question"
      redirect_to Question.find(comment.commentable.id)
    else
      redirect_to Question.find(comment.commentable.question_id)
    end

  end

  private
    def comments_params
      params.require(:comment).permit(:text, :commentable_type, :commentable_id).merge(user: current_user)
    end
end
