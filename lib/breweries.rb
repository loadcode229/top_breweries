#def scrape_top_brewery_page

  #  html = Nokogiri::HTML(open(index_url))
  #  breweries = []

   # html.css("div.body-text__content").each do |brewery|
   #     state = brewery.css("h2.body-text__paragraph-header font--h2")
   #     name = brewery.css("a").text
   #     brewery_link = brewery.css("a").attribute("href").value
   #     city = brewery.css("em").first.text
   #     description = brewery.css(".p body-text__paragraph-text font--body has--spacing")

  #      brewery_info = {:state => state,
  #                  :name => name,
 #                   :brewery_link => brewery_link,
 #                   :city => city,
#                    :description => description}
 #       breweries << brewery_info
#    end
#    breweries
#end    

class TopBreweries::Breweries
    attr_accessor :name, :city, :state, :brewery_link, :description, :twitter, :facebook, :instagram :location

    @@all = []

    def initialize(name = nil, brewery_link = nil, city = nil, state = nil, location)
        @name, @brewery_link, @city, @state @location = name, brewery_link, city, state, location
        @@all << self
    end

    def self.new_from_index_page(r)
        self.new(
            r.css("a").text,
            "https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-america#{r.attribute("href").text}",
            r.css("h2.").text
        )
    end
    
    def location
        @location = "#{@city}, #{@state}"
    end

    def description
        p.text
    end


    def self.all
        @@all
    end
end