require_relative './lib/top_breweries/version'

Gem::Specification.new do |s|
  s.name = 'top-breweries'
  s.version = TopBreweries::VERSION
  s.date = '2020-04-18'
  s.summary = 'Top Breweries in each State"'
  s.description = "Provides details on the Best Breweries in America"
  s.files = ["lib/top_breweries.rb", "lib/cli.rb", "lib/scraper.rb", "lib/breweries.rb", "config/environment.rb"]
  s.homepage = 'https://github.com/loadcode229/top_breweries'
  s.license = "MIT"
  s.executables << 'top-breweries'

  s.add_development_dependency "bundler", "~> 1.17.2"
  s.add_development_dependency "rake", "~> 12.3.3"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
  s.add_development_dependency "json", "~> 2.1.0"
end
