products = MongoMapper.database["products"]
ETSY_SAMPLE_DATA.each do |product|
  products.insert product
end