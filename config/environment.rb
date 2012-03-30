# Be sure to restart your server when you modify this file

Encoding.default_internal = 'UTF-8'

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

$revision = `git rev-parse HEAD`

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.action_mailer.delivery_method = :smtp
end
