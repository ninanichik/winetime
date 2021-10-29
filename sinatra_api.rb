require 'sinatra'
require "sinatra/activerecord"
require './models'

set :database, "sqlite3:development.sqlite3"

get '/' do
  @users = User.all
  erb :index
end

get '/list' do
  "There will be list of your wines"
end

post '/create-new-note' do
  body = JSON.parse(request.body.read)
  puts body.to_json
end

put '/modify-new-note/:id' do
  body = JSON.parse(request.body.read)
  puts body.to_json
end

delete '/delete-note/:id' do
  [204, 'deleted']
end