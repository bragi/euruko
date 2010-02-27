Factory.define(:payment) do |f|
  f.association :user, :factory => :user
  f.seller_id 1
  f.amount 45.00
  f.description 'Euruko 2010 registration'
  f.firstname "John"
  f.lastname "Doe"
  f.email "john@example.com"
end