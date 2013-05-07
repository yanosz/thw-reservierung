# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_thw-reservierung_session',
  :secret      => 'f8a54d2a6c54bdc6734a34a940ef1f8b5fefe5045ff33ae612598a5c897288b3265e34e34eb80cb898c4d6af7cb0f5c54f5b60569dc37c73e1076594c8214428'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
