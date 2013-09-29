class Home < ChitterApp
  
  get '/' do
    @peeps = Peep.all(order: [:created_at.desc])
    haml :index
  end
end