set :application, "play.chesskids.com.au"
set :repository,  "git@github.com:chessworld/live.git"

set :scm, :git
set :deploy_to, "/var/www/#{application}"

server 'root@184.106.191.30', :app, :web, :db, :primary => true
