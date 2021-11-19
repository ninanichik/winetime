require 'sinatra'
require "sinatra/activerecord"
require './models/users'
require './models/wines'

set :database, "sqlite3:development.sqlite3"

get '/users' do
  UsersControllers.instance.show_users
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

get '/wines' do
  WinesControllers.instance.show_wines
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

post '/wine/new' do
  body = JSON.parse(request.body.read)
  puts body.to_json, 202
  WinesControllers.instance.add_new_wine(:name, :wine_variety, :produced_year, :produced_place, :created_at)
end

put '/wine/:id' do
  WinesControllers.instance.update_wine(:name, :wine_variety, :produced_year, :produced_place, :created_at)
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

get '/wine/:id' do
  WinesControllers.instance.get_wine
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

delete '/wine/:id' do
  WinesControllers.instance.delete_wine
  [204, 'deleted']
end