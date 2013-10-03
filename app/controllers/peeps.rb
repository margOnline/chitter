class Peeps < ChitterApp
  Pusher.app_id = :app_id
  Pusher.key = :app_key
  Pusher.secret = :app_secret

  get '/peeps/new' do
    haml :"peeps/new"
  end
  
  post '/peeps' do
    post = params["post"]
    created_at = Time.new
    maker_id = session[:maker_id]
    
    peep = Peep.create(:post => post, :created_at => created_at, :maker_id => maker_id)
    created_at = peep.created_at.strftime('%e %b %R')
    Pusher.trigger('peeps', 'add-peep', {"post" => peep.post, "peep_maker" => peep.maker, "created_at" => created_at})
  end
end


