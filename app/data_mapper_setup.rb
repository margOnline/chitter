env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, ENV["DATABASE_URL"])

# DataMapper.auto_upgrade!

DataMapper.finalize