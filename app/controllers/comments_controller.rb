class CommentsController < ApplicationController
  def create
    comment = Comment.new(comments_params)
    comment.user = current_user
    comment.save

    redirect_to Question.find(comment.commentable_id)
  end

  private
    def comments_params
      params.require(:comment).permit(:text, :commentable_type, :commentable_id).merge(user: current_user)
    end
end
