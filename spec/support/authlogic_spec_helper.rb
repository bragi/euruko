module AuthlogicSpecHelper
  include Authlogic::TestCase
  def user
    User.first || Factory.create(:user)
  end
  def login_user(user=user)
    UserSession.create(user)
  end
end

