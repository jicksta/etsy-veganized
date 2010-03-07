class ApplicationController < ActionController::Base
  
  # FILTERS = {
  #   "Tag name" => ["is", "isn't"],
  #   "Materials used" => ["includes", "does not include"],
  #   "Seller username" => ["is", "isn't"],
  #   "Title" => ["contains", "does not contain", "is", "isn't"],
  #   "Distance" => ["is closer than", "is farther than"],
  #   "Price" => ["is less than", "is greater than"]
  # }
  
  
  FILTERS = {
    "Tag name" => {
      :operators => ["is", "isn't"],
      :operands => :text
    },
    "Materials used" => {
      :operators => ["includes", "does not include"],
      :operands => :text
    },
    "Seller username" => {
      :operators => ["is", "isn't"],
      :operands => :text
    },
    "Title" => {
      :operators => ["contains", "does not contain", "is", "isn't"],
      :operands => :text
    },
    "Distance" => {
      :operators => ["is closer than", "is farther than"],
      :operands  => ["5 miles", "10 miles", "25 miles", "50 miles", "100 miles",
                  "250 miles", "500 miles", "1,000 miles", "2,500 miles"]
    },
    "Price" => {
      :operators => ["is less than", "is greater than"],
      :operands  => :currency
    }
  }
  
  
  
  
  protect_from_forgery
end
