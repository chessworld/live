namespace :maint do
  desc 'Delete inactive users'
  task :delete_inactive => :environment do
    User.destroy_all 'created_at < date_sub(now(), interval 1 week) and not active'
  end
end