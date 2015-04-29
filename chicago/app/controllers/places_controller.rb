# Description of changes
# 1. Modified "submitted" method into "create"
# 2. Included a limit for the index page following best practices
# 3. Included a handler for non-existent places in show and edit
# 4. Modified update method to use named routing

class PlacesController < ApplicationController

  def index
    # Include a limit, following best practices
    @places = Place.all.limit(100)
  end

  def show
    @place = Place.find(params[:id])

    # Include a handler if the place does not exist
    if @place == nil
      redirect_to places_url, notice: "Place not found"
    end

  end

  def new
  end

  def create
    Place.create title: params[:title],
                 price: (params[:price].to_f * 100).to_i,
                 photo_url: params[:url],
                 desc: params[:desc]

    redirect_to root_path
  end

  def edit
    @place = Place.find(params[:id])

    # Include a handler if the place does not exist
    if @place == nil
      redirect_to places_url, notice: "Place not found"
    end

  end

  def update
    @place = Place.find(params[:id])
    @place.update title: params[:title],
                 price: (params[:price].to_f * 100).to_i,
                 photo_url: params[:url],
                 desc: params[:desc]

    redirect_to place_url(@place.id)
  end

  def delete
    Place.delete(params[:id])
    redirect_to root_path
  end


end
