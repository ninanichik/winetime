require 'sinatra'
require "sinatra/activerecord"
require './models/users'
require './models/wines'

set :database, "sqlite3:development.sqlite3"

get '/' do
  users_list = UsersControllers.instance
  users_list.show_users
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

get '/wines' do
  wines_list = WinesControllers.instance
  wines_list.show_wines
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

post '/wine/new' do
  body = JSON.parse(request.body.read)
  puts body.to_json, 202
  new_wine = WinesControllers.instance
  new_wine.add_new_wine

end

put '/wine/:id' do
  update_wine = WinesControllers.instance
  update_wine.update_wine
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

get '/wine/:id' do
  wine = WinesControllers.instance
  wine.get_wine
  body = JSON.parse(request.body.read)
  puts body.to_json, 200
end

delete '/wine/:id' do
  deleted_wine = WinesControllers.instance
  deleted_wine.delete_wine
  [204, 'deleted']
end