get '/skills' do
  @skills = Skill.all
  erb :'/skills/index'
end

get '/skills/:id' do
  @skill = Skill.find(params[:id])
  erb :'/skills/show'
end