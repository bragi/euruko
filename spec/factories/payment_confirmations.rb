Factory.define(:payment_confirmation) do |f|
  f.association :payment
  f.seller_id 1
  f.status 1
  f.t_id 1
  f.amount 40.0
  f.original_amount 40.0
  f.email "john@example.com"
  f.t_status 1
  f.description "Euruko 2010 registration"
  f.md5 "7810e895485e11f704d4fee66e07af9c"
  f.t_date {Time.now}
end