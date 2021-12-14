require 'sinatra'
require "sinatra/activerecord"
require './controllers/users'
require './controllers/wines'

set :database, "sqlite3:development.sqlite3"

get '/users' do
  status 200
  body UsersControllers.instance.show_users
end

get '/wines' do
  status 200
  body WinesControllers.instance.show_wines
end

post '/wine/new' do
  status 202
  body WinesControllers.instance.add_new_wine(params[:name, :wine_variety, :produced_year, :produced_place, :created_at])
end

put '/wine/:id' do
  status 202
  body WinesControllers.instance.update_wine(params[:name, :wine_variety, :produced_year, :produced_place, :created_at])
end

get '/wine/:id' do
  status 200
  body WinesControllers.instance.get_wine
end

delete '/wine/:id' do
  status 204
  WinesControllers.instance.delete_wine
  body ['deleted']
end