class TopBreweries::Scraper

    def self.get_page
        Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-america"))
    end

    def self.scrape_breweries_index
        self.get_page.css("div[class='body-text__content']")
    end

    def self.make_breweries
        scrape_breweries_index.each do |r|
            TopBreweries::Breweries.new_from_index_page(r)
        end
    end

end