set :application, "play.chesskids.com.au"
set :repository,  "git@github.com:chessworld/live.git"

set :scm, :git
set :deploy_to, "/var/www/#{application}"

server 'root@chesskids.com.au', :app, :web, :db, :primary => true
