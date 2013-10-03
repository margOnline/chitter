class ChitterApp < Sinatra::Base
  helpers ChitterHelpers

  enable :sessions
  set :session_secret, 'super secret session'
  use Rack::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')
  set :partial_template_engine, :haml

  set :app_id, ENV['API_ID']
  set :secret, ENV['API_SECRET']
  set :key, ENV['API_KEY']


end