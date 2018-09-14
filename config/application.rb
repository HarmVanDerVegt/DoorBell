require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DoorBell5
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    listener = Listen.to('public') do |modified, added, removed|
      unless added.blank?
        1.times do
          print "#{added[0]}"
          print " FILE ADDED \n"
          Image.create(added[0])
        end
      end
    end
    listener.start
  end
end
