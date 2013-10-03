class Peeps < ChitterApp
  Pusher.app_id = '55593'
  Pusher.key = '64f9dd5db97a8ce00355'
  Pusher.secret = 'f497b9469b0ab0e0c29d'

  get '/peeps/new' do
    haml :"peeps/new"
  end
  
  post '/peeps' do
    post = params["post"]
    created_at = Time.new
    maker_id = session[:maker_id]
    
    peep = Peep.create(:post => post, :created_at => created_at, :maker_id => maker_id)
    Pusher.trigger('peeps', 'add-peep', {"post" => peep.post})
  end
end