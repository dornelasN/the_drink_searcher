class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
    @drinks_feed = Drink.search(drink_params)
  end
  
  def new
    @drink = Drink.new
  end

  private

  def drink_params
    params.permit(:name, :description, :image_url, :rating_avg, :alcohol_level, :ibu, :temperature)
  end
end
