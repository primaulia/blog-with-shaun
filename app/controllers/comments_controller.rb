class CommentsController < ApplicationController
  def create
    render json: params
  end
end
