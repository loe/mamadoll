# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mammadoll_session',
  :secret      => 'b1a1d771f784e633a19d647b2d6fe8c71e6e47eb54d5b535317838c190aa2f763a4d676dcb3f23eb0dda4a4ffb7356af381dd89c9bc5b131b9916bc1e27629b5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
