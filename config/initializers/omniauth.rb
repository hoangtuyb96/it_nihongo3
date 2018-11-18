OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '88214354619-kmfkevoq5sigss13aeee42obhvnbo4gk.apps.googleusercontent.com', '4dmJK6uzU2PyNe4mDWPESaGm', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
