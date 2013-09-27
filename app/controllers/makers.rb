class Makers < ChitterApp

  get '/makers/new' do
    @maker = Maker.new
    haml :"makers/new"
  end

  post '/makers' do
    @maker = maker.create(
                :first_name => params[:first_name],
                :last_name => params[:last_name],
                :email => params[:email],
                :username => params[:username],
                :password => params[:password],
                :password_confirmation => params[:password_confirmation])
    if @maker.save
      session[:maker_id] = @maker.id
      redirect to('/')
    else
      flash.now[:errors] = @maker.errors.full_messages
      haml :"makers/new"
    end
  end
end