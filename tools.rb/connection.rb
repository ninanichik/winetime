require 'faraday'
require 'json'
require 'faraday/net_http'
require 'faraday_middleware'
require 'securerandom'

# to delete 8-12 rows

#Faraday.default_adapter = :net_http

# conn = Faraday.new('http://localhost:4567/')
# conn.request(:basic_auth, 'admin', 'admin')
# conn.adapter  :net_http

# name of class would be good to have more meaning
class Helper
  # remove host and port attributes, add just url
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
    # remove @response from everywhere until it's getting used
    @response = @connection.get('/wines')
    # remove puts
    puts @response
  end

  def get_users
    @response = @connection.get('/users')
  end

  # remove default values
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

  #remove default values
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
    #remove puts
    puts @response.body
  end

  def delete_wine(id)
    @response = @connection.delete("/wine/#{id}")
    #remove puts
    puts @response.status
  end

  #for example
  def random_params
    {
        name: SecureRandom.uuid,
        wine_variety: SecureRandom.uuid,
        produced_year: SecureRandom.uuid,
        produced_place: SecureRandom.uuid
    }
  end

  def params_null(key)
    random_params[key] = null
  end
end
