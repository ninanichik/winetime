require 'faraday'
require 'json'


connection = Faraday.new('http://localhost:4567/') do |f|
  f.request :json
  f.response :json
  # f.adapter :net_http # adds the adapter to the connection, defaults to `Faraday.default_adapter`
end

response = connection.get('/wines')
puts response.body
puts response.status

response = connection.get('/users')
puts response.body

response = connection.post '/wine/new', { :name => 'Brunello di Montalcino',
                                          :wine_variety => 'White',
                                          :produced_year => '2000',
                                          :produced_place => 'Italy' }
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