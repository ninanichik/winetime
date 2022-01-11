require 'sinatra'
require "sinatra/activerecord"
require './controllers/users'
require './controllers/wines'

set :database, "sqlite3:development.sqlite3"
set :default_content_type, :json

get '/users' do
  status 200
  UsersControllers.instance.show_users.to_json
end

get '/wines' do
  status 200
  WinesControllers.instance.show_wines.to_json
end

post '/wine/new' do
  status 201
  WinesControllers.instance.add_new_wine(params[:name], params[:wine_variety], params[:produced_year], params[:produced_place]).to_json
end

put '/wine/:id' do
  status 202
  WinesControllers.instance.update_wine(params[:id], params[:name], params[:wine_variety], params[:produced_year], params[:produced_place]).to_json
  WinesControllers.instance.get_wine(params[:id]).to_json
end

get '/wine/:id' do
  status 200
  WinesControllers.instance.get_wine(params[:id]).to_json
end

delete '/wine/:id' do
  status 204
  WinesControllers.instance.delete_wine(params[:id]).to_json
  body ['deleted']
  redirect '/wines'
end