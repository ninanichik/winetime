require 'faraday'
require 'json'
require 'faraday/net_http'

Faraday.default_adapter = :net_http

connection = Faraday.new('http://localhost:4567/') do |f|
  f.basic_auth('admin', 'admin')
end

response = connection.get('/wines')
puts response.body
puts response.status

response = connection.get('/users')
puts response.body

response = connection.post '/wine/new' do |req|
  req.params['name'] = 'Brunello di Montalcino'
  req.params['wine_variety'] = 'White'
  req.params['produced_year'] = '2000'
  req.params['produced_place'] = 'Italy'
  req.headers['Content-Type'] = 'application/json'
end

puts response.body
puts response.status

response = connection.put '/wine/4' do |req|
  req.params['name'] = 'Moet Chandon Nectar Imperial'
  req.params['wine_variety'] = 'White semi-dry'
  req.params['produced_year'] = '2010'
  req.params['produced_place'] = 'France'
  req.headers['Content-Type'] = 'application/json'
end

puts response.body
puts response.status

response = connection.get('/wine/4')
puts response.body
puts response.status

response = connection.delete('/wine/5')
puts response.status
