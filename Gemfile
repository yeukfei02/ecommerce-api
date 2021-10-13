source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'activeadmin', '~> 2.9.0'
gem 'annotate', '~> 3.1'
gem 'bcrypt', '~> 3.1.16'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.7.3'
gem 'dotenv-rails', '~> 2.7.6'
gem 'jbuilder', '~> 2.11.2'
gem 'jwt', '~> 2.2.2'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pronto', '~> 0.11.0'
  gem 'pronto-brakeman', '~> 0.11.0'
  gem 'pronto-fasterer', '~> 0.11.1'
  gem 'pronto-reek', '~> 0.11.0'
  gem 'pronto-rubocop', '~> 0.11.1'
  gem 'reek', '~> 6.0.3'
  gem 'rexml', '~> 3.2'
  gem 'rubocop', '~> 1.12.0'
  gem 'solargraph', '~> 0.40.4'
  gem 'thor', '~> 1.1'
end

group :development do
  gem 'brakeman', '~> 5.1'
  gem 'fasterer', '~> 0.9.0'
  gem 'listen', '~> 3.3'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
