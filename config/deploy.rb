require "bundler/capistrano"
require 'sidekiq/capistrano'

load "config/capistrano/base"
load "config/capistrano/rbenv"
load "config/capistrano/nginx"
load "config/capistrano/unicorn"
load "config/capistrano/postgresql"
load "config/capistrano/nodejs"
load "config/capistrano/redis"
load "config/capistrano/check"

server "198.199.66.151", :web, :app, :db, primary: true

set :application, "stewardshippro_staging"
set :user, "stewardshippro_staging"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :database_name, "stewardshippro_staging"

set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository,  "git@github.com:lmcardle/StewardshipPro.git"
set :branch, "digocean2"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases