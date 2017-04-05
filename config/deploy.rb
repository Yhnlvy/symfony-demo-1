# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "SymfonyDemo"
set :repo_url, "git@github.com:Yhnlvy/symfony-demo-1.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/ubuntu/symfony-demo-1/www"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
   desc 'Restart application'
   task :restart do
     on roles(:app), in: :sequence, wait: 5 do
       # Your restart mechanism here, for example:
       sudo "service php7.0-fpm restart"
       sudo "service nginx restart"
     end
   end
 end

 namespace :composer do
  desc 'Composer Install - Get Bundles'
  task :install do
    on roles(:app) do
        execute "cd /home/ubuntu/symfony-demo-1/www/current/ && composer install"   
        sudo "chmod -R 777 /home/ubuntu/symfony-demo-1" 
    end
  end
end

