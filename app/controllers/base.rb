class ChitterApp < Sinatra::Base
  helpers MakerHelpers

  enable :sessions
  set :session_secret, 'super secret session'
  use Rack::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')
  set :partial_template_engine, :haml
end