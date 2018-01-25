class PostsController < ApplicationController
  def new
    render html: 'goes here'
  end

  def create
  end

  def show
    @the_post = Post.find(params[:id]) # ref to the post obj
    @all_comments_the_post_has = @the_post.comments # ref to all comments that the post has

    @new_comment_by_user = current_user.comments.new # black comment obj that tagged to the current user

    # render json: @all_comments_the_post_has
  end
end
