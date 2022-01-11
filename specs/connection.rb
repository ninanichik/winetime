require 'faraday'
require 'json'

#iniitialaze
connection = Faraday.new('http://localhost:4567/') do |f|
  f.request :json # encode req bodies as JSON and automatically set the Content-Type header
  f.response :json # decode response bodies as JSON
  # f.adapter :net_http # adds the adapter to the connection, defaults to `Faraday.default_adapter`
end

response = connection.get('/wines')
puts response.body
puts response.status