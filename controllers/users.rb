require 'singleton'
require './models/users'

class UsersControllers
  include Singleton

  def show_users
    @users = User.all.map(&:to_s)
    #erb :index
  end
end