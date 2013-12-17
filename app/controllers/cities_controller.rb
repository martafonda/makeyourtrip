class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :destroy, :update]

  def index
    @cities = City.all
  end

  def show
    @places = Place.all
  end
  
  def new
    @city = City.new
  end
  
  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to city_path(@city)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @city.update(city_params)
      redirect_to city_path(@city)
    else
      render :edit
    end
  end
  
  def destroy
    @city.destroy
    redirect_to cities_url
  end

  protected
  def set_city
    @city = City.find(params[:city_id] || params[:id])
  end
  def city_params
    params.require(:city).permit(:name, :arrival, :departure, :comment, :latitude, :longitude)
  end
end
