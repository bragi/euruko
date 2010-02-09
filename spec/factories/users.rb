Factory.define(:user) do |u|
  u.sequence(:email) {|i| "user#{i}@example.com"}
  u.password "user123"
  u.password_confirmation "user123"
  u.first_name "John"
  u.last_name "Doe"
end
