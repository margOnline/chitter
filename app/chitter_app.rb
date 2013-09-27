require 'sinatra/base'
require 'data_mapper'
require 'haml'
require 'rack-flash'
require 'sinatra/partial'

######### MODELS / CONTROLLERS #########
require_relative './data_mapper_setup'
require_relative 'models/maker'
require_relative 'models/peep'
require_relative 'helpers/application'

require_relative 'controllers/base'
require_relative 'controllers/home'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'
require_relative 'controllers/makers'
#######################################

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret session'
  use Rack::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')
  set :partial_template_engine, :haml

######### DEFINE ROUTE PATHS #########
  
  get('/') {Home.call(env)}
  get('/sessions/new') {Sessions.call(env)}
  post('/sessions') {Sessions.call(env)}
  delete('/sessions') {Sessions.call(env)}
  get('/makers/new') {Makers.call(env)}
  post('/makers') {Makers.call(env)}
  get ('/peeps/new') {Peeps.call(env)}
  post ('/peeps') {Peeps.call(env)}

#######################################

  run! if app_file == $0

end
