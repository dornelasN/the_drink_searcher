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
    # Return drinks sorted by name!
    return drinks_list.sort_by{ |drink| drink.name }
  end

  def self.recommend_drinks(drink_params, drink_list)
    initial_size = drink_list.size
    
    # Check if rating, temperature, alcohol level, and/or bitternes level are provided and filter the list
    if(drink_params[:rating_avg] != "")
      drink_list = select_by_rating(drink_params[:rating_avg], drink_list)
    end
    if(drink_params[:alcohol_level] != "")
      drink_list = select_by_alcohol_level(drink_params[:alcohol_level], drink_list)
    end
    if(drink_params[:ibu] != "")
      drink_list = select_by_bitterness_level(drink_params[:ibu], drink_list)
    end
    if(drink_params[:temperature] != "")
      drink_list = select_by_temperature(drink_params[:temperature], drink_list)
    end

    return drink_list
  end

  def self.select_by_rating(rating, drink_list)
    return drink_list.select{|drink| drink.rating_avg >= rating.to_f}
  end

  def self.select_by_alcohol_level(alcohol_level, drink_list)
    return drink_list.select{|drink| drink.alcohol_level <= alcohol_level.to_i}
  end

  def self.select_by_bitterness_level(bitterness_level, drink_list)
    return drink_list.select{|drink| drink.ibu <= bitterness_level.to_i }
  end

  def self.select_by_temperature(temperature, drink_list)
    return drink_list.select{|drink| drink.temperature == temperature}
  end
end
