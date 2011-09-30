source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'jquery-rails'  

# Delayed_job (or DJ) encapsulates the common pattern of asynchronously 
# executing longer tasks in the background. It is a direct extraction from 
# Shopify where the job table is responsible for a multitude of core tasks. 
gem 'delayed_job', '~> 2.1.4'

# Gems used only for assets and not required in production environments by 
# default.  
group :assets do  
  gem 'sass-rails', " ~> 3.1.0"  
  gem 'coffee-rails', " ~> 3.1.0"  
  gem 'uglifier'  
end  
  
group :development do
  gem 'annotate', '2.4.0'
  
  # RSpec-2 for Rails-3
  gem "rspec-rails", "~> 2.6"
end

group :test do
  
  # Nokogiri (鋸) is an HTML, XML, SAX, and Reader parser. Among Nokogiri's many
  # features is the ability to search documents via XPath or CSS3 selectors.
  # XML is like violence - if it doesn’t solve your problems, you are not using
  # enough of it.
  gem 'nokogiri', "~> 1.5.0"
  
  # VCR provides a simple API to record and replay your test suite's HTTP
  # interactions. It works with a variety of HTTP client libraries, HTTP
  # stubbing libraries and testing frameworks.
  gem 'vcr', '~> 1.10.0'
  
  # FakeWeb is a helper for faking web requests in Ruby. It works at a global
  # level, without modifying code or writing extensive stubs.
  gem 'fakeweb', '~> 1.3.0'
  
  # factory_girl_rails provides integration between factory_girl and rails 3
  # (currently just automatic factory definition loading)
  gem "factory_girl_rails", "~> 1.1.0"
  
  # RSpec-2 for Rails-3
  gem "rspec-rails", "~> 2.6"

  # Faker, a port of Data::Faker from Perl, is used to easily generate fake 
  # data: names, addresses, phone numbers, etc.
  gem "faker", "~> 1.0.0"

  gem "cucumber-rails", "~> 1.0.5"

  # Strategies for cleaning databases. Can be used to ensure a clean state for 
  # testing.
  gem "database_cleaner", "~> 0.6.7"

  # Code coverage for Ruby 1.9 with a powerful configuration library and 
  # automatic merging of coverage across test suites.
  gem "simplecov", :git => "https://github.com/colszowka/simplecov.git"
end
