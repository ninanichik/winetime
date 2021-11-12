class UsersControllers
  def show_users
    @users = User.all
    erb :index
  end
end