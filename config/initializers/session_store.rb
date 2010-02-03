# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_euruko_session',
  :secret      => '1078a4661fc31683feb2673cb0a24e922dfee4eaa4823b8c57e82896b2e74e7ee121b10731f8ffb8aca1bd68145ab4f0c3d988aa1cb6c465ffd8f0a892429733'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
