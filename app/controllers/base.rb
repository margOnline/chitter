class ChitterApp < Sinatra::Base
  helpers UserHelpers

  enable :sessions
  set :session_secret, 'super secret session'
  use Rack::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :views, File.join(File.dirname(__FILE__), '..', 'views')
  set :partial_template_engine, :haml
end