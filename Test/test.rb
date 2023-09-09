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
end

p User.new("Jamy", "jamy@gmail.com", ["running", "golf"]).all