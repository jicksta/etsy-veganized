settings = YAML.load_file(File.join(Rails.root, "config", "database.mongo.yml"))[Rails.env]

Mongoid.configure do |config|
  database      = settings["database"]
  config.master = Mongo::Connection.new.db database
end
