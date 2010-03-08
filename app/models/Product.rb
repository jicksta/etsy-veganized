class Product
  include Mongoid::Document
  field :tags, :type => Array
  field :materials, :type => Array
  field :price, :type => Float
  
  field :all_images, :type => Array
  
  field :city
  field :creation_epoch
  field :currency_code
  field :description
  field :ending_epoch
  field :hsv_color
  field :image_url_155x125
  field :image_url_200x200
  field :image_url_25x25
  field :image_url_430xN
  field :image_url_50x50
  field :image_url_75x75
  field :materials
  field :rgb_color
  field :section_title
  field :sold_out_epoch
  field :state
  field :title
  field :url
  field :user_name
  
  field :num_favorers, :type => Integer
  field :listing_id, :type => Integer
  field :lon, :type => Float
  field :lat, :type => Float
  field :section_id, :type => Integer
  field :quantity, :type => Integer
  field :user_image_id, :type => Integer
  field :user_id, :type => Integer
  field :views, :type => Integer
  
  
end