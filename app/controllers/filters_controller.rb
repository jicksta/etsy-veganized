class FiltersController < ApplicationController
  def index
    @products = ETSY_SAMPLE_DATA[0..500]
  end
end
