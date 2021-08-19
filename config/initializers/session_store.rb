if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_rpg-character-creator', domain: 'https://roweeena.github.io/project2/' 
  else
    Rails.application.config.session_store :cookie_store, key: '_rpg-character-creator'

end
