Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '61847186403-s4dhmbqte5j3qe7g27msoligvoaoln3t.apps.googleusercontent.com', 'u-c9_3QWDKP7ZOwnpbs2VlKd'
  end
