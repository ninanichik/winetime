require 'faraday'
require 'json'
require 'faraday/net_http'
require 'faraday_middleware'
require_relative '../specs/random_params.rb'
require 'pry'

class ConnectionHelper
  include RandomParams

  def initialize
    @connection = Faraday.new("http://localhost:4567/") do |f|
      f.adapter :net_http
      f.use FaradayMiddleware::FollowRedirects, limit: 5
      f.request(:basic_auth, 'admin', 'admin')
    end
  end

  def get_wines
    @connection.get('/wines')
  end

  def get_users
    @connection.get('/users')
  end

  def add_new_wine(name, wine_variety, produced_year, produced_place)
    @connection.post '/wine/new' do |req|
      req.params['name'] = name
      req.params['wine_variety'] = wine_variety
      req.params['produced_year'] = produced_year
      req.params['produced_place'] = produced_place
      req.headers['Content-Type'] = 'application/json'
    end
  end

  def update_wine(id, name, wine_variety, produced_year, produced_place)
    @connection.put "/wine/#{id}" do |req|
      req.params['name'] = name
      req.params['wine_variety'] = wine_variety
      req.params['produced_year'] = produced_year
      req.params['produced_place'] = produced_place
      req.headers['Content-Type'] = 'application/json'
    end
  end

  def get_wine_by_id(id)
    @connection.get("/wine/#{id}")
  end

  def delete_wine(id)
    @connection.delete("/wine/#{id}")
  end
end

@connection_helper = ConnectionHelper.new
