get '/sessions/new' do
  redirect '/login'
end

# new session route
get '/login' do
  erb :login
end

# create session route
post '/login' do
  skipper = Skipper.find_by(name: params[:name])
  if skipper && skipper.password == params[:password]
    session[:skipper_id] = skipper.id
    redirect '/skippers'
  else
    @errors = ["Wrong skipper name or password"]
    erb :login
  end
end

# delete session route
get '/logout' do
  session.clear
  redirect '/'
end
