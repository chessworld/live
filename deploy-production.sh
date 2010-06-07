#!/bin/bash

read -p "Press enter to deploy changes to production server..."
rsync -rtcvzp -e "ssh -p 222" --chmod=a+rwx app config Rakefile lib public script vendor test doc root@chesskids.com.au:/var/www/live
