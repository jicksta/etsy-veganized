class Product
  include Mongoid::Document

  NON_VEGAN_MATERIALS = %w[wool leather cashmere silk feather feathers wool_blend]
  BABY_TAGS =  %w[baby toddler infant child kid children]
  FEMALE_TAGS = %w[dress blouse skirt lingerie]
  
  validates_uniqueness_of :listing_id
  
  named_scope :vegan, any_in(:materials => NON_VEGAN_MATERIALS)
  named_scope :adult, any_in(:tags => BABY_TAGS)
  named_scope :male,  any_in(:tags => FEMALE_TAGS)
  
  field :title
  field :url
  field :price, :type => Float
  field :tags, :type => Array
  field :materials, :type => Array
  field :all_images, :type => Array
  
  field :user_name
  field :city
  field :currency_code
  field :description
  field :hsv_color
  field :rgb_color
  field :section_title
  field :sold_out_epoch
  field :state
  
  # Are these :type => Datetime ???
  field :creation_epoch
  field :ending_epoch
  
  field :image_url_25x25
  field :image_url_50x50
  field :image_url_75x75
  field :image_url_155x125
  field :image_url_200x200
  field :image_url_430xN
  
  field :num_favorers,  :type => Integer
  field :listing_id,    :type => Integer
  field :section_id,    :type => Integer
  field :user_image_id, :type => Integer
  field :user_id,       :type => Integer
  field :views,         :type => Integer
  
  field :lon, :type => Float
  field :lat, :type => Float
  
  # field :quantity, :type => Integer # Useless
  
end