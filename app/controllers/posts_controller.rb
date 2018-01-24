class PostsController < ApplicationController
  def new
    render html: 'goes here'
  end

  def create
  end

  def show
    @the_post = Post.find(params[:id])
    @all_comments_the_post_has = @the_post.comments

    @new_comment_by_user = current_user.comments.new
  end
end
