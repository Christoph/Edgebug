RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem "rspec-rails", :version => '=1.2.9', :lib => 'spec/rails'
  ##config.gem "cucumber", :version => '=0.6.0' causes problem with rake
  ##config.gem "cucumber-rails", :version => '=0.2.3'
  config.gem "webrat", :version => '=0.6.0'
  config.gem "sqlite3-ruby", :lib => "sqlite3", :version => '=1.2.5' unless ENV["RAILS_ENV"] == "production"
  config.gem "haml", :version => '=2.2.16'
  config.gem "factory_girl", :lib => "factory_girl", :version => '>= 1.2.3'
  config.gem "faker", :version => '>= 0.3.1'
  config.gem "pickle", :lib => false, :version => ">=0.2.1"

  
  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
end
