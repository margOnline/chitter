require 'sinatra/base'
require 'data_mapper'
require 'haml'
require 'rack-flash'
require 'sinatra/partial'
require './pusher_config'
require 'pusher'

######### MODELS / CONTROLLERS #########
require './app/models/maker'
require './app/models/peep'
require './app/data_mapper_setup'
require './app/helpers/application'
require './app/controllers/base'
require './app/controllers/home'
require './app/controllers/sessions'
require './app/controllers/peeps'
require './app/controllers/makers'
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

  before do
    @pusher_key = APP_KEY
  end
  
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
