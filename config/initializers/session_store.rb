if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_rpg-character-creator', domain: 'your-frontend-domain' # To replace later
  else
    Rails.application.config.session_store :cookie_store, key: '_rpg-character-creator'

end
