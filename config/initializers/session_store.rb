# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_paintbox-app_session',
  :secret      => '00e5b9b1e78382a8f0cf2ef9c668d459611aa2042b25a24c27160a7e4a1879b4825225fdbff2716fb9e1e3b490465b4653408197cc5d7006da38deaebf712fc7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
