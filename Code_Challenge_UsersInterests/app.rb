get '/users' do
  erb :index
end

get '/users/:name' do
  @user = User.all.find { |user| user.name == params[:name] }
  erb :user
end

helpers do 
  def count_interests
    User.all.map { |user| user.interests.split(', ').count }.sum
  end
end