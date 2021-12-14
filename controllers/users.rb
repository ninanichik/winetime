require 'singleton'
require './models/users'

class UsersControllers
  include Singleton

  def show_users
    @users = User.all.map do |user|
      "User id: #{user.id}, fname: #{user.fname}, lname: #{user.lname}, email: #{user.email} and phone: #{user.phone}"
    end
  end
end