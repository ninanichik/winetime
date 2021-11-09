require 'sinatra'
require "sinatra/activerecord"
require './models/users'
require './models/wines'

set :database, "sqlite3:development.sqlite3"

get '/' do
  @users = User.all
  erb :index
end

get '/wines' do
  "There will be list of your wines"
  @wines = Wines.all
  erb :index
end

post '/wine/new' do
  @new_wine=Wines.create(params[:name], params[:wine_variety], params[:produced_year], params[:produced_place], params[:created_at])
  erb :index
end

put '/wine/:id' do
  @wine = wine.find(params[:id])
  @wine.update(params[:name], params[:wine_variety], params[:produced_year], params[:produced_place], params[:created_at])
  @wine.save
  redirect '/wine/'+params[:id]
  # body = JSON.parse(request.body.read)
  # puts body.to_json
end

get '/wine/:id' do
  @wine = Wines.find(params[:id])
  erb :show
end

delete '/wine/:id' do
  @wine = Wine.find(params[:id])
  @wine.destroy
  redirect '/wines'
  [204, 'deleted']
end