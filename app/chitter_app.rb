require 'sinatra/base'
require 'data_mapper'
require 'haml'
require 'rack-flash'
require 'sinatra/partial'

######### MODELS / CONTROLLERS #########

require_relative 'models/maker'
require_relative 'models/peep'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
 
######### DEFINE ROUTE PATHS #########
  


#######################################
  run! if app_file == $0

end
