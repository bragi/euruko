module Administration::UsersHelper
  def users_presentations(user)
    user.presentations.empty? ? "None" : user.presentations.length
  end
end
