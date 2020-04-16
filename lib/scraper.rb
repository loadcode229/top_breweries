class TopBreweries::Scraper

    def get_page
        Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-america"))
    end

    def scrape_breweries_index
        self.get_page.css("div[class='body-text__content']")
    end

    def make_breweries
        scrape_breweries_index.each do |r|
            TopBreweries::Breweries.new_from_index_page(r)
        end
    end

end