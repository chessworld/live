#!/bin/bash

read -p "Press enter to deploy changes to production server..."
rsync -rtcvzp -e "ssh -p 222" --chmod=a+rwx app config Rakefile lib public script vendor db --exclude db/schema.rb test doc root@chesskids.com.au:/var/www/live
