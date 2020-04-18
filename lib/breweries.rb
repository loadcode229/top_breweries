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
    attr_accessor :name, :url, :position, :state

    @@all = []

    def initialize(name = nil, url = nil, position = nil, state = nil)
        @name = name
        @url = url
        @position = position
        @state = state
        @@all << self
    end

    def self.new_from_index_page(r)
        self.new(
            r.css("h2").text,
            "https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-america#{r.attribute("href").text}",
            r.css("em").text
        )
    end
    

    def description
        @description ||= doc.css("div.body-text__content").css("p").text
    end

    def doc
        doc ||= Nokogiri::HTML(open(self.url))
    end

    def self.find(id)
        self.all[id-1]
    end

    def self.all
        @@all
    end
end