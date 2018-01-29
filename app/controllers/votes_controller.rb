class VotesController < ApplicationController
  def upvote
    upvoted_post = Post.find(params[:post_id])
    redirect_to root_path if current_user.upvote(upvoted_post)
  end

  def downvote
    downvoted_post = Post.find(params[:post_id])
    redirect_to root_path if current_user.downvote(downvoted_post)
  end
end
