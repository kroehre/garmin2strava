source 'https://rubygems.org'

ruby '2.0.0'

#environment
gem 'rails', '4.1.1'
gem 'pg'
gem 'thin'
gem 'figaro'

gem 'haml-rails'
gem 'simple_form'
gem 'httparty'

group :assets do
  gem 'sass-rails', '~> 4.0.3'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'jquery-rails'
  gem 'bootstrap-sass'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_20]
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails', '>= 3.0.0.beta2'
  gem 'rspec-its'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
  gem 'launchy'
  gem 'selenium-webdriver'
end
