# hello.rb
require 'D:\Ruby31-x64\lib\ruby\gems\3.1.0\gems\rack-2.2.4\lib\rack.rb'

class Hello
  def self.call(env)
    ['200', {'Content-Type' => 'text/html'}, ['Hello, Rack!']]
  end
end

Rack::Handler::WEBrick.run(Hello, :Port => 8090, :Host => '0.0.0.0')

