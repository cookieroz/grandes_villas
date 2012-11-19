###### START DEPLOY.RB ######
# Your cPanel/SSH login name
set :user , "grandesv"

# The domain name of the server to deploy to,
# this can be your domain or the domain of the server.
set :server_name, "grandesvillas.railsplayground.net"

# Your svn / git login name
set :scm_username , "cookieroz"
set :scm_passphrase, "hoeroz12"

# If you are using git, uncomment the following line and comment out the line above.
set :scm, :git

# The name of your application, this will also be the folder were your application
# will be deployed to
set :application, "grandes_villas"

# the url for your repository
set :repository, "git@github.com:cookieroz/grandes_villas.git"

set :branch, "master"

#set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true


###### There is no need to edit anything below this line ######
set :deploy_to, "/home/#{user}/#{application}"
set :use_sudo, false
set :group_writable, false
default_run_options[:pty] = true
role :app, server_name
role :web, server_name
role :db,  server_name, :primary => true

# set the proper permission of the public folder
task :after_update_code, :roles => [:web, :db, :app] do
  run "chmod 755 #{release_path}/public"
  run "chmod 755 #{release_path}/public/dispatch.fcgi"
  run "chmod 755 #{release_path}/public/dispatch.cgi"
end

namespace :deploy do
  desc "cold deploy"
  task :cold do
    update
    fastcgi::create_public_link
    fastcgi::restart
  end
  desc "restart dispatchers"
  task :restart do
    fastcgi::restart
  end
end

namespace :fastcgi do
  desc "Restart dispatchers"
  task :restart do
    run "killall -9 dispatch.fcgi"
  end
  desc "Create symbolic link"
  task :create_public_link do
    run "cd /home/#{user}; mv public_html public_html_bk; ln -s #{current_path}/public ~/public_html"
  end
end
###### END DEPLOY.RB ######

#set :application, "set your application name here"
#set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end