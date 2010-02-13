default_run_options[:pty] = true
set :user, "bragi-web"
set :deploy_to, "/home/bragi-web/euruko"
set :application, "euruko"
set :scm, :git
set :repository,  "http://github.com/bragi/euruko.git"
set :branch, "master"
set :normalize_asset_timestamps, false
set :use_sudo, false

role :web, "sandbox.carriles.pl"                          # Your HTTP server, Apache/etc
role :app, "sandbox.carriles.pl"                          # This may be the same as your `Web` server
role :db,  "sandbox.carriles.pl", :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :euruko do
  task :link_database_configuration do
    run "ln -s #{deploy_to}/database.yml #{latest_release}/config/"
  end
  task :link_database do
    run "ln -s #{deploy_to}/production.sqlite3 #{latest_release}/db/"
  end
  task :link do
    link_database_configuration
    link_database
  end
end

after "deploy:finalize_update", "euruko:link"
