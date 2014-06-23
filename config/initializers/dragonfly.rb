require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "72756be2904eb60831b0740996a43d9d4df662faf4dec98b485478962b8446ed"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
# Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  #ActiveRecord::Base.extend Dragonfly::Model
  #ActiveRecord::Base.extend Dragonfly::Model::Validations
end
