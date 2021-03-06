source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use pg as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use active-model-serializers to build GeoJSON
gem 'active_model_serializers'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use Nokogiri to parse XML
gem 'nokogiri'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use AWS for asset management
gem 'aws-sdk'

# Front end
# gem 'bourbon'
# gem 'neat'
gem 'refills'

# Use unicorn as the app server
gem 'unicorn'

# Use Paperclip for image management
gem 'paperclip', "~> 4.2"

# Use Gon to access variables in js in views
gem 'gon'

# Geospatial gems
gem 'rgeo'
gem 'rgeo-geojson'
gem 'rgeo-activerecord'
gem 'activerecord-postgis-adapter'

# Cartography
gem 'leaflet-rails', github: "axyjo/leaflet-rails"
gem 'leaflet-markercluster-rails'

gem 'squeel'

# Snow Gems
gem 'snotel'

gem 'sidekiq'

group :development, :test do
  gem 'rspec-rails'
  gem 'pry'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'seed_dump'
  gem 'spring-commands-rspec'
	gem 'capybara'
	gem 'shoulda-matchers', require: false
	gem 'launchy'
end

group :test do
  gem 'nyan-cat-formatter'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0'
end
