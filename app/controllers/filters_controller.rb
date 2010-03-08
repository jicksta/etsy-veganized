class FiltersController < ApplicationController
  def index
    @products = Product.all.limit 200
  end
end
