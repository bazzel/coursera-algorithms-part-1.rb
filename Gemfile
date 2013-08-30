source 'https://rubygems.org'

gem 'yard'

group :development do
  if RUBY_PLATFORM.downcase.include?("darwin")
    gem 'terminal-notifier-guard'
  end
end

group :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'rspec'
end

