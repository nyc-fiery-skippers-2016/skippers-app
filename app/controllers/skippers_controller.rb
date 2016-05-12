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
  @skipper = Skipper.new
  erb :'/skippers/new'
end

# create route
post '/skippers' do
  @skipper = Skipper.new(params[:skipper])
  if @skipper.save
    session[:skipper_id] = @skipper.id
    redirect "/skippers/#{@skipper.id}"
  else
    @errors = @skipper.errors.full_messages
    erb :'/skippers/new'
  end
end

# show route
get '/skippers/:id' do
  @skipper = Skipper.find_by(id: params[:id])
  erb :'/skippers/show'
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

post '/skippers/:id/images' do
  @skipper = Skipper.find(params[:id])
  image = Image.new(params[:image])
  image.imageable = @skipper
  if image.save
    redirect "/skippers/#{@skipper.id}"
  else
    @errors = image.errors.full_messages
    erb :'/skippers/show'
  end
end

post '/skippers/:id/skills' do
  skipper = Skipper.find(params[:id])
  skipper.skills = Skill.build_from_string(params[:skills])
  redirect "/skippers/#{skipper.id}"
end

get '/supersecretroute' do
  if logged_in?
    "ALL THE RICHES IN THE WORLD... AND SECRETS... AND THE KEY!!!!!!"
  else
    "YOU CANNOT ACCESS THIS ROUTE"
  end
end

