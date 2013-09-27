class Home < ChitterApp
  
  get '/' do
    @peeps = Peep.order_by('created_at', ':desc')
    haml :index
  end
end