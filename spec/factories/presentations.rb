Factory.define(:presentation) do |f|
  f.topic "Presentation"
  f.description "What this presentation is about"
  f.speaker_description "Rails dev with 25 years of field experience"
  f.length "standard"
  f.association :user, :factory => :user
end