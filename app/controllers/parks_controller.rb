class ParksController < ApplicationController
  def index
    @all_parks = Park.all.order(created_at: :asc)
  end

  def show
    # get the id from the url
    # by the id, talk to the db
    # find parks table
    # find parks by the id
    @searched_park = Park.find(params[:id]) # .find method only by id
  end

  def show_by_name
    searched_park_by_name = Park.find_by(name: params[:name])
    render json: searched_park_by_name
  end

  def new
    # pass an empty of a park to the user
    @new_park = Park.new
  end

  
end
