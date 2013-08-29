source 'https://rubygems.org'

gem 'yard'

group :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'rspec'

  if RUBY_PLATFORM.downcase.include?("darwin")
    gem 'terminal-notifier-guard'
    #gem 'growl'
    #gem 'rb-fsevent'
  end

end
