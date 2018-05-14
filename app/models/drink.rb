class Drink < ApplicationRecord
  validates :name, :description, :image_url, presence: true
  validates :rating_avg, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :alcohol_level, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # Bitterness level
  validates :ibu, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  enum temperature: %i[
    hot
    warm
    ambient
    cold
    extra_cold
  ]

  def self.search(drink_params)
    drinks_list = []
    # Easy search ( search by drink's name)
    if(drink_params[:name])
      drinks_list = Drink.select{|drink| drink.name == drink_params[:name]}
    elsif
      # Recommend me (receive recommendation of drinks based on user inputs)
      drinks_list = recommend_drinks(drink_params, Drink.all)
    end
    return drinks_list.sort_by{ |drink| drink.name }
  end

  def self.recommend_drinks(drink_params, drink_list)
    # If rating is provided, also check for temperature, alcohol level, and bitternes level
    if(drink_params[:rating_avg])
      drink_list = Drink.select_by_rating(drink_params[:rating_avg].to_i, drink_list)
    
      if(drink_params[:temperature])
        drink_list = select_by_temperature(drink_params[:temperature], drink_list)
      end
    # if RATING is NOT provided, check for temperature, alcohol level, and bitternes level
    elsif(drink_params[:temperature])
      drink_list = select_by_temperature(drink_params[:temperature], drink_list)
    # if RATING and TEMPERATURE are NOT provided, check for alcohol level, and bitterness level
    #elsif(drink_params[:alcohol_level])
      
    # if RATING, TEMPERATURE, and ALCOHOL level are not provided, finally, check only for Bitterness level
    #elsif(drink_params[:ibu])
    
    end
    return drink_list
  end

 #drink_list = Drink.select{ |drink| drink_params[:rating_avg].to_i >= drink.rating_avg}

  def self.select_by_rating(rating, drink_list)
    puts "I GOT INTO SELECT BY RATING"
    drinks = drink_list.select{|drink| drink.rating_avg >= rating.to_i}
    # puts "#{drinks} DRINKS ON SELECT BY RATING"
    return drinks
  end

  def self.select_by_temperature(temperature, drink_list)
    return drink_list.select{|drink| drink.temperature == temperature}
  end
end
