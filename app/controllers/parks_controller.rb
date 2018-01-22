class ParksController < ApplicationController
  def index
    all_parks = Park.all
    render json: all_parks
  end

  def show
    # get the id from the url
    # by the id, talk to the db
    # find parks table
    # find parks by the id
    searched_park = Park.find(params[:id]) # .find method only by id
    render json: searched_park
  end

  def show_by_name
    searched_park_by_name = Park.find_by(name: params[:name])
    render json: searched_park_by_name
  end
end
