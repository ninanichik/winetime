require 'faraday'
require 'json'
require 'pry'
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

response = connection.post('/wine/new') do |req|
  req.params['name'] = 'Brunello di Montalcino'
  req.params['wine_variety'] = 'White'
  req.params['produced_year'] = '2000'
  req.params['produced_place'] = 'Italy'
  # make default for all requests
  req.headers['Content-Type'] = 'application/json'
end

puts response.body
puts response.status

response = connection.put '/wine/4', { :name => 'Muscato',
                                         :wine_variety => 'White',
                                         :produced_year => '2000',
                                         :produced_place => 'Italy' }

puts response.body
puts response.status

response = connection.get('/wine/4')
puts response.body
puts response.status

response = connection.delete('/wine/5')
puts response.status