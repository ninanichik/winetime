require 'sinatra'
require "sinatra/activerecord"
require './models/users'
require './models/wines'

set :database, "sqlite3:development.sqlite3"

get '/' do
  users_list = UsersControllers.new
  users_list.show_users
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

get '/wines' do
  wines_list = WinesControllers.new
  wines_list.show_wines
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

post '/wine/new' do
  new_wine = WinesControllers.new
  new_wine.add_new_wine
  body = JSON.parse(request.body.read)
  puts body.to_json, 202
end

put '/wine/:id' do
  update_wine = WinesControllers.new
  update_wine.update_wine
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

get '/wine/:id' do
  wine = WinesControllers.new
  wine.get_wine
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

delete '/wine/:id' do
  deleted_wine = WinesControllers.new
  deleted_wine.delete_wine
  [204, 'deleted']
end