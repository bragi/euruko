Factory.define(:billing_information) do |f|
  f.name "Johndoery Inc."
  f.address <<-ADDRESS
12 Some Street
Interesting City
90-210
Even Better Country
ADDRESS
  f.taxid "0980808098098"
  f.association :user, :factory => :user
end