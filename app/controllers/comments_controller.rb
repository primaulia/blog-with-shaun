class CommentsController < ApplicationController
  def create
    new_comment = current_user.comments.new(comment_params)
    current_user.comments << new_comment
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :post_id)
  end
end
