get '/' do
  redirect '/skippers'
end

# index route
get '/skippers' do
  @skippers = Skipper.all
  erb :'/skippers/index'
end

# new route
get '/skippers/new' do
  erb :'/skippers/new'
end

# create route
post '/skippers' do
  skipper = Skipper.new(params[:skipper])
  if skipper.save
    session[:skipper_id] = skipper.id
    redirect "/skippers/#{skipper.id}"
  else
    @errors = skipper.errors.full_messages
    erb :'/skippers/new'
  end
end

# show route
get '/skippers/:id' do
  @skipper = Skipper.find_by(id: params[:id])
  if @skipper == current_skipper
    erb :'/skippers/show'
  else
    halt(403, "NOT AUTHORIZED")
  end
end

get '/skippers/:id/edit' do
  @skipper = Skipper.find_by(id: params[:id])
  erb :'/skippers/edit'
end

put '/skippers/:id' do
  skipper = Skipper.find_by(id: params[:id])
  skipper.update(params[:skipper])
  redirect "/skippers/#{skipper.id}"
end

delete '/skippers/:id' do
  skipper = Skipper.find_by(id: params[:id])
  skipper.destroy
  redirect '/skippers'
end

get '/supersecretroute' do
  if logged_in?
    "ALL THE RICHES IN THE WORLD... AND SECRETS... AND THE KEY!!!!!!"
  else
    "YOU CANNOT ACCESS THIS ROUTE"
  end
end

