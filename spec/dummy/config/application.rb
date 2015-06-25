require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)
require 'fagus'

module Spec
  class Application < Rails::Application
    config.time_zone = 'Pacific Time (US & Canada)'

    config.active_record.raise_in_transactional_callbacks = true
  end
end
