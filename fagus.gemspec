$:.push File.expand_path('../lib', __FILE__)

require 'fagus/version'

Gem::Specification.new do |s|
  s.name = 'fagus'
  s.version = Fagus::VERSION
  s.authors = ['Joseph Bridgwater-Rowe']
  s.email = ['joe@westernmilling.com']
  s.homepage = 'https://github.com/westernmilling/fagus'
  s.summary = 'Item list engine.'
  s.description = 'Item representation and categorization.'
  s.license = ''
  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']

  s.add_dependency 'mysql2'
  s.add_dependency 'rails', '~> 4.2.2'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'rspec-its'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'shoulda-matchers'
end
