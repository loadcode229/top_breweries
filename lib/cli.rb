require_relative "../lib/scraper.rb"
require_relative "../lib/breweries.rb"
require 'nokogiri'
require 'colorize'

class TopBreweries::CLI

    BASE_PATH = "https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-americaS"
    
    def start
        make_breweries
        add_attributes_to_breweries
        display_breweries
        puts "HELLO WORLD"
    end

    def make_breweries
        breweries_array = TopBreweries::Scraper.scrape_index_page(BASE_PATH + 'index.html')
        TopBreweries::Brewery.create_from_collection(breweries_array)
    end

    def add_attributes_to_breweries
        TopBreweries::Brewery.all.each do |brewery|
            attributes = TopBreweries::Scraper.scrape_brewery_page(BASE_PATH + brewery.brewery_url)
            brewery.add_attributes_to_breweries(attributes)
        end
    end

    def display_breweries
        TopBreweries::Brewery.all.each do |brewery|
            puts "#{brewery.state.upcase}".colorize(:red)

        end
    end
end