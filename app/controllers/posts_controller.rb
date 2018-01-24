class PostsController < ApplicationController
  def new
    render html: 'goes here'
  end

  def create
  end

  def show
    @the_post = Post.find(params[:id])
    # find all comments for this post
  end
end
