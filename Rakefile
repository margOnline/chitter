require 'data_mapper'
require './app/data_mapper_setup'
require_relative 'models/maker'
require_relative 'models/peep'
task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (no data loss)"
end

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (with data loss)"
end