class ApplicationController < ActionController::Base
  
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
  
  VEGAN_FILTER = [
    ["Materials used", "does not include", "wool"],
    ["Materials used", "does not include", "silk"],
    ["Materials used", "does not include", "leather"],
    ["Materials used", "does not include", "feather"],
    ["Materials used", "does not include", "feathers"]
  ]
  
  MANLY_FILTER = [
    ["Title", "does not contain", "skirt"],
    ["Title", "does not contain", "dress"],
    ["Title", "does not contain", "skirt"],
    ["Title", "does not contain", "corset"]
  ]
  
  MISC_FILTER = [
    ["Title", "does not contain", "easter"]
  ]
  
  protect_from_forgery
end
