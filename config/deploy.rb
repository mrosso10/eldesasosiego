
# Change these
# server 'your_server_ip', port: your_port_num, roles: [:web, :app, :db], primary: true
role :app, %w(ubuntu@ec2-18-219-198-49.us-east-2.compute.amazonaws.com)
role :web, %w(ubuntu@ec2-18-219-198-49.us-east-2.compute.amazonaws.com)
role :db, %w(ubuntu@ec2-18-219-198-49.us-east-2.compute.amazonaws.com)

set :ssh_options,
    keys: %w(~/keys/ec2-2017.pem), 
    forward_agent: false
# port: 17341,
# forward_agent: false,
# auth_methods: %w(password)

set :application, 'pg_template'
set :repo_url, 'git@github.com:programandoarg/pg_template.git'
set :branch, 'master'
# set :repo_url,        'git@example.com:username/appname.git'
# set :application,     'appname'
# set :user,            'deploy'
set :puma_threads,    [1, 1]
set :puma_workers,    1

# Don't change these unless you know what you're doing
# set :pty,             true
set :pty,             false
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/var/www/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
# set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to false when not using ActiveRecord
set :puma_default_hooks, -> { false }
set :sidekiq_concurrency, 2

set :rbenv_ruby, File.read('.ruby-version').strip

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
set :linked_files, %w(.rbenv-vars token.yaml)

set :linked_dirs,  %w(log public/uploads public/system tmp/cache)

# namespace :puma do
#   desc 'Create Directories for Puma Pids and Socket'
#   task :make_dirs do
#     on roles(:app) do
#       execute "mkdir #{shared_path}/tmp/sockets -p"
#       execute "mkdir #{shared_path}/tmp/pids -p"
#     end
#   end

#   before :start, :make_dirs
# end
# namespace :sidekiq do
#   desc 'Create Directories for Sidekiq logs'
#   task :make_dirs do
#     on roles(:app) do
#       execute "mkdir #{shared_path}/log/ -p"
#       execute "mkdir #{shared_path}/tmp/pids -p"
#     end
#   end

#   before :start, :make_dirs
# end

namespace :deploy do
  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end

  #   desc 'Initial Deploy'
  #   task :initial do
  #     on roles(:app) do
  #       before 'deploy:restart', 'puma:start'
  #       invoke 'deploy'
  #     end
  #   end

  # desc 'Restart application'
  # task :restart do
  #   on roles(:app), in: :sequence, wait: 5 do
  #     invoke 'puma:restart'
  #   end
  # end
  desc 'Restart application'
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:stop'
    end
  end
  desc 'Restart application'
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:start'
    end
  end

  before :starting, :check_revision
  #   after  :finishing,    :compile_assets
  #   after  :finishing,    :cleanup
  # after  :finishing,    :restart
  after  :finishing,    :stop
  after  :finishing,    :start
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
