Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['61847186403-dvcc6a8nfitajfq73oja8o8d4jp682vf.apps.googleusercontent.com'], ENV['T6EfrfP8AsgMaEQBbYLGDJzw']
  end