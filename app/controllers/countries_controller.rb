# CountriesController
class CountriesController < ApplicationController
  def index
    puts 'hello Counties index'
  end

  def show
    @name = params[:id]
  end
end
