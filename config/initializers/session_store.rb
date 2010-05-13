# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_live_session',
  :secret      => '37b638b269a0e0bfb7ed2fae2588d137c119bf92e71825969af5f55d8f0bb715b46e51fe84ecb504f3c6d991ea1f9fafecc64d7b7015389ae63badb90c5bae1a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
