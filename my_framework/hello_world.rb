# require_relative 'advice'
class Advice
  def initialize
    @advice_list = [
      "Look deep into nature, and then you will understand everything better.",
      "I have found the paradox, that if you love until it hurts, there can be no more hurt, only more love.",
      "What we think, we become.",
      "Love all, trust a few, do wrong to none.",
      "Oh, my friend, it's not what they take away from you that counts. It's what you do with what you have left.",
      "Lost time is never found again.",
      "Nothing will work unless you do."
    ]
  end

  def generate
    @advice_list.sample
  end
end

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', {'Content-Type' => 'text/html'}, [erb[:index]]]
    when '/advice'
      piece_of_advice = Advice.new.generate
      ['200', 
        {"Content-Type" => 'text/html'}, 
        ["<html><body><b><em>#{piece_of_advice}</em></b></body></html>"]]
    else
      [
        '404',
        {"Content-Type" => 'text/html', "Content-Length" => '48'},
        ["<html><body><h4>404 Not Found</h4></body></html>"]
      ]
    end
  end

  private

  def erb(filename, local = {})
    b = binding
    template = File.read("views/index.erb")
    ERB.new(template).result
  end
end

# advice = Advice.new.generate
# p advice