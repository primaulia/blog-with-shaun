class ParksController < ApplicationController
  # skip_before_action :verify_authenticity_token / disable authenticity token

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

  def create
    Park.create(park_params)
    redirect_to parks_path
  end

  def update
    @edited_park = Park.find(params[:id])
    @edited_park.update(park_params)
    redirect_to @edited_park
  end

  def destroy
    park = Park.find(params[:id])
    park.destroy
    redirect_to parks_path
  end

  def edit
    @searched_park = Park.find(params[:id])
  end

  private

  def park_params
    params.require(:park).permit(:name, :description, :picture)
  end
end
