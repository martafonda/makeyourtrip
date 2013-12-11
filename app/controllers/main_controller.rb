class MainController < ApplicationController
  def index
    @cities = City.all
  end
end