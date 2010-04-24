class FiltersController < ApplicationController
  def index
    @products = Product.all.vegan.adult.male.limit(200)
  end
end
