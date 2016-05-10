get '/skills' do
  @skills = Skill.all
  erb :'/skills/index'
end

get '/skills/:id' do
  @skill = Skill.find(params[:id])
  erb :'/skills/show'
end

post '/skills' do
  @skill = Skill.create(name: params[:name])
  if request.xhr? # AJAX is actually what's called an XMLHTTPRequest
    # just send back the li tag
    erb :'/skills/_individual_skill', layout: false, locals: {skill: @skill}
  else
    redirect '/skills'
  end
end
