require "sinatra/activerecord/rake"
require 'sinatra/activerecord'
require './sinatra_api.rb'

namespace :db do
  task :load_config do
    require "./sinatra_api.rb"
  end
end





namespace :learning do
  task :default do
    puts "Hello World!"
  end

  desc 'Ring the bell'
  task :ring do
    puts "Bell is ringing."
  end

  desc 'Enter home'
  task :enter => :ring do
    puts "Entering home!"
  end
end
