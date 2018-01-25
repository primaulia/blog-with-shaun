class CommentsController < ApplicationController
  def create
    new_comment = current_user.comments_made.new(comment_params)
    current_user.comments_made << new_comment
    redirect_to post_path(new_comment.post)
  end

  def notifications
    # find all comments made for my posts
    @all_comments = current_user.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :post_id)
  end
end
