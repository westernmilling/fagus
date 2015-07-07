RSpec.configure do |config|
  config.include Fagus::Engine.routes.url_helpers, :type => :feature
end
