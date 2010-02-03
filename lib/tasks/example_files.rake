desc "Creates necessary files from provided templates"
task "prepare" do
  `cp config/database.yml{.example,}`
end