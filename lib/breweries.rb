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
    attr_accessor :state, :name, :brewery_link, :city, :description, :twitter, :facebook, :instagram

    @@all = []

    def initialize(brewery_hash)
        self.send("state=", brewery_hash[:state])
        self.send("name=", brewery_hash[:name])
        self.send("brewery_link=", brewery_hash[:brewery_link])
        self.send("city=", brewery_hash[:city])
        self.send("description=", brewery_hash[:description])
        @@all << self
    end

    def self.create_from_collections(breweries_array)
        breweries_array.each do |brewery_hash|
            TopBreweries::Brewery.new(brewery_hash)
        end
    end

    def add_brewery_attributes(attributes_hash)
        self.send("twitter=", attributes_hash[:twitter])
        self.send("instagram=", attributes_hash[:instagram])
        self.send("facebook=", attributes_hash[:facebook])
    end

    def self.all
        @@all
    end
end