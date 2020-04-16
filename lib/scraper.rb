require 'open-uri'
require 'pry'
require 'nokogiri'

class TopBreweries::Scraper

    def self.scrape_index_page(index_url)

        html = Nokogiri::HTML(open(index_url))
        breweries = []

        html.css("div.body-text__content").each do |brewery|
            state = brewery.css("h2.body-text__paragraph-header font--h2").text
            name = brewery.css("a").text
            brewery_link = brewery.css("a").attribute("href").value
            city = ("em")
            description = brewery.css(".p body-text__paragraph-text font--body has--spacing")

            brewery_info = {:state => state,
                        :name => name,
                        :brewery_link => brewery_link,
                        :city => city,
                        :description => description}
            breweries << brewery_info
        end
        breweries
    end    
end