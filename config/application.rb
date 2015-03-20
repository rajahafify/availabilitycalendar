require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module AvailabilityCalendar
  class Application < Rails::Application
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.stylesheets false
      generate.request_specs false
      generate.routing_specs false
      generate.test_framework :rspec
      generate.view_specs false
    end    
    config.active_record.raise_in_transactional_callbacks = true
  end
end
