class Sessions < ChitterApp
  
  get '/sessions/new' do
    haml :"sessions/new"
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    maker = Maker.authenticate(email, password)
    if maker
      session[:maker_id] = maker.id
      redirect to('/')
    else
      flash[:errors] = ["The email or password are incorrect"]
      haml :"sessions/new"
    end
  end

  delete '/sessions' do
    flash[:notice] = "Thanks for peeping, fly back soon!"
    session[:maker_id] = nil
    redirect to('/')
  end
end