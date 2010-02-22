module Administration::UsersHelper
  def user_presentations(user)
    user.presentations.empty? ? "None" : user.presentations.length
  end
end
