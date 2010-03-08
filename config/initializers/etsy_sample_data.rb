require 'yaml'
ETSY_SAMPLE_DATA = YAML.load_file File.join(Rails.root, "db", "mens-clothing-1.yml")
