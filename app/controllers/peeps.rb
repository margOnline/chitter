class Peeps < Sinatra::Base
  
  get '/peeps/new' do
    haml :"peeps/new"
  end
  
  post '/peeps' do
    post = params["post"]
    created = Time.new
    maker_id = session[:maker_id]
    
    Peep.create(:post => post, :created => created, :maker_id => maker_id)
    redirect to('/')
  end
end