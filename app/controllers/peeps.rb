class Peeps < ChitterApp
  
  get '/peeps/new' do
    haml :"peeps/new"
  end
  
  post '/peeps' do
    post = params["post"]
    created_at = Time.new
    maker_id = session[:maker_id]
    
    Peep.create(:post => post, :created_at => created_at, :maker_id => maker_id)
    redirect to('/')
  end
end