set :application, "live"
set :repository,  "ssh://tobias@chesskids.com.au:222/home/tobias/git/live.git"

set :scm, :git
set :deploy_to, "/var/www/#{application}"

server 'root@chesskids.com.au:222', :app, :web, :db, :primary => true
