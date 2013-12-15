class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :destroy, :update]
  before_action :set_city, except:[:show, :update, :edit]
  def index
    @places = @city.places
  end

  def show
  end
  
  def new
    @place = @city.places.build
  end
  
  def create
    @place = @city.places.build(place_params)
    if @place.save
      redirect_to @place
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      render :edit
    end
  end
  
  def destroy
    @place.destroy
    redirect_to cities_path
  end

  protected
  def set_place
    @place = Place.find(params[:id])
  end
  def set_city
    @city = City.find(params[:city_id] || params[:id])
  end
  def place_params
    params.require(:place).permit(:name, :description, :address, :datetime)
  end
end
