# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_edgebug_session',
  :secret      => 'db6aa8b9fa9aae0db7e15923ff8f30e8d4f6347420aaada1470c8e1dfa26c164f992b720a557f518fb73537a89a1b0e267e5abfa3ca1e7d30640aa0c7fd7ff8d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
