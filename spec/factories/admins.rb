Factory.define(:admin) do |u|
  u.sequence(:email) {|i| "user#{i}@example.com"}
  u.password "user123"
  u.password_confirmation "user123"
  u.first_name "Chuck"
  u.last_name "Norris"
end
