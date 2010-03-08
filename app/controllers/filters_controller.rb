class FiltersController < ApplicationController
  def index
    @products = Product.all.
                  limit(200).
                  where(:materials.nin => %w[wool leather cashmere silk feather feathers]).
                  where(:tags.nin => %w[baby dress blouse skirt])
  end
end
