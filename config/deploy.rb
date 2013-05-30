require "bundler/capistrano"
# require 'sidekiq/capistrano'

load "config/capistrano/base"
load "config/capistrano/rbenv"
load "config/capistrano/nginx"
load "config/capistrano/unicorn"
load "config/capistrano/postgresql"
load "config/capistrano/nodejs"
# load "config/capistrano/redis"
load "config/capistrano/check"

server "198.199.112.178", :web, :app, :db, primary: true

set :application, "textspaceadjuster"
set :user, "textspaceadjuster"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :database_name, "textspaceadjuster"

set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository,  "git@github.com:lmcardle/text_space_adjuster.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases