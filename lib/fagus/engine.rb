require 'ransack'
require 'uuid'

module Fagus
  class Engine < ::Rails::Engine
    isolate_namespace Fagus

    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.test_framework :rspec, :fixture => false
      g.view_specs false
      g.helper_specs false
    end
  end
end
