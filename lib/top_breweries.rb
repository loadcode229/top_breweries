require_relative "./top_breweries/version"
require_relative "./cli.rb"
require_relative "./breweries.rb"
require_relative "./scraper.rb"
require "httparty"
require "pry"
require "nokogiri"

module TopBreweries
  class Error < StandardError; end
  # Your code goes here...
end
