require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

if Rails.env.development? || Rails.env.test?
  datastore :file,
            root_path: Rails.root.join('public/system/dragonfly', Rails.env),
            server_root: Rails.root.join('public')
else
  datastore :s3,
            bucket_name: ENV['BUCKET_NAME'],
            access_key_id: ENV['S3_KEY'],
            secret_access_key: ENV['S3_SECRET'],
            url_scheme: 'https',
            region: "us-west-2"

end

end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
