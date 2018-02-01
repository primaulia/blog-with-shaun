class PagesController < ApplicationController
  def home
    # list out all posts
    # list out all posts that the current user wrote
    # render that in the page

    @posts = Post
              .left_joins(:votes)
              .group(:id)
              .order('COALESCE(SUM(votes.score)) DESC')
    @my_posts = current_user.posts if current_user
  end

  def about

  end
end
