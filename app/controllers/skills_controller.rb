get '/skills' do
  @skills = Skill.all
  erb :'/skills/index'
end


get '/skills/:id' do
  @skill = Skill.find(params[:id])
  erb :'/skills/show'
end

post '/skills/:id/images' do
  skill = Skill.find(params[:id])
  skill.images.create(params[:image])
  redirect "/skills/#{skill.id}"
end

get '/skills/:id/get_skippers' do
  @skill = Skill.find(params[:id])
  content_type :json
  @skill.skippers.pluck(:name).to_json
end

post '/skills' do
  @skill = Skill.create(name: params[:name])
  if request.xhr? # AJAX is actually what's called an XMLHTTPRequest
    # Server side rendering — responding with HTML
    erb :'/skills/_individual_skill', layout: false, locals: {skill: @skill}
    # Client side rendering — responding with JSON
    # (JavaScript Object Notation - JS object as a string)
    # {name: @skill.name, id: @skill.id}.to_json
  else
    redirect '/skills'
  end
end

