class CommentsController < ApplicationController
  def create
    @comment = current_user.comments_made.new(comment_params)
    current_user.comments_made << @comment

    respond_to do |format|
      # format.html { render html: 'html flow here'} # normal post req flow
      format.js
      # format.json {}
    end


    # no more redirection for js
    # redirect_to post_path(new_comment.post)
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
