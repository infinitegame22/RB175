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

class User
  attr_accessor :name, :email, :interests

  def initialize(name, email, interests)
    @name = name
    @email = email
    @interests = interests
  end

  def self.all
    users_data = YAML.load_file('users.yaml')
    users_data.map do |name, data|
      User.new(name, data[:email], data[:interests].join(', '))
    end
  end

  # Define any helper methods you need here
end