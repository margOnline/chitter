class Maker < Sinatra::Base

  get '/users/new' do
    haml :"sessions/new"
  end

  post '/sessions' do
    name = [:name]
    username = params[:username] 
    email = params[:email]
    password = params[:name]
    if maker
      session[:maker_id] = maker.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password are not correct']
      haml :"/sessions/new"
    end
  end

  delete '/sessions' do
    flash[:notice] = "Good bye - we hope to see you again soon!"
    session[:maker_id] = nil
    redirect to('/')
  end


end