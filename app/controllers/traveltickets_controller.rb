class TravelticketsController < ApplicationController
  before_action :set_travelticket, only: [:show, :edit, :destroy, :update]
  before_action :set_city, except:[:show, :update, :edit]
  def index
    @traveltickets = @city.traveltickets
  end

  def show
  end
  
  def new
    @travelticket = @city.traveltickets.build
  end
  
  def create
    @travelticket = @city.traveltickets.build(travelticket_params)
    if @travelticket.save
      redirect_to @travelticket
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @travelticket.update(travelticket_params)
      redirect_to travelticket_path(@travelticket)
    else
      render :edit
    end
  end
  
  def destroy
    @travelticket.destroy
    redirect_to cities_path
  end

  protected
  def set_travelticket
    @travelticket = Travelticket.find(params[:id])
  end
  def set_city
    @city = City.find(params[:city_id] || params[:id])
  end
  def travelticket_params
    params.require(:travelticket).permit(:origin, :destination, :type, :departure, :place)
  end
end
