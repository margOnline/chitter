class Peeps < ChitterApp
  
  get '/peeps/new' do
    haml :"peeps/new"
  end
  
  post '/peeps' do
    post = params["post"]
    created_at = Time.new
    maker_id = session[:maker_id]
    
    peep = Peep.create(:post => post, :created_at => created_at, :maker_id => maker_id)
    #check header response for request type if AJax request send it back to the client side
    # if ajax?
      # peep.to_json
      haml :list_peeps, locals:{peep: peep, peep_maker: peep.maker}, :layout => !request.xhr?
    # else
      # redirect to('/')
    # end
  end
end