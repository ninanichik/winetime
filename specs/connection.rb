require 'faraday'
require 'json'
require 'faraday/net_http'
require 'faraday_middleware'

#Faraday.default_adapter = :net_http

# conn = Faraday.new('http://localhost:4567/')
# conn.request(:basic_auth, 'admin', 'admin')
# conn.adapter  :net_http

class Helper

  def initialize(host = 'localhost', port = 4567)
    @host = host
    @port = port
    @connection = Faraday.new("http://#{@host}:#{@port}/") do |f|
      f.adapter :net_http
      f.use FaradayMiddleware::FollowRedirects, limit: 5
      f.request(:basic_auth, 'admin', 'admin')
    end
  end

  def get_wines
    @response = @connection.get('/wines')
    puts @response
  end

  def get_users
    @response = @connection.get('/users')
  end

  def add_new_wine(name = 'Brunello di Montalcino', wine_variety = 'White', produced_year = '2000', produced_place = 'Italy')
    @response = @connection.post '/wine/new' do |req|
      req.params['name'] = name
      req.params['wine_variety'] = wine_variety
      req.params['produced_year'] = produced_year
      req.params['produced_place'] = produced_place
      req.headers['Content-Type'] = 'application/json'
    end
    puts @response
  end

  def update_wine(id, name = 'Moet Chandon Nectar Imperial', wine_variety = 'White semi-dry', produced_year = '2010', produced_place = 'France')
    @response = @connection.put "/wine/#{id}" do |req|
      req.params['name'] = name
      req.params['wine_variety'] = wine_variety
      req.params['produced_year'] = produced_year
      req.params['produced_place'] = produced_place
      req.headers['Content-Type'] = 'application/json'
    end
  end

  def get_wine_by_id(id)
    @response = @connection.get("/wine/#{id}")
    puts @response.body
  end

  def delete_wine(id)
    @response = @connection.delete("/wine/#{id}")
    puts @response.status
  end
end
