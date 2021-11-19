require 'singleton'

class UsersControllers
  include Singleton

  def show_users
    @users = User.all
    erb :index
  end
end