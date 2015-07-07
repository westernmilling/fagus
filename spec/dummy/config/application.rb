require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)
require 'fagus'
require 'figaro'

module Spec
  class Application < Rails::Application
    config.time_zone = 'Pacific Time (US & Canada)'

    config.active_record.raise_in_transactional_callbacks = true

    config.secret_key_base = Figaro.env.SECRET_KEY_BASE
  end
end
