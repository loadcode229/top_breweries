class TopBreweries::Breweries
    attr_accessor :state, :name, :city, :description, :url

    @@all = []

    def self.new_from_index_page(r)
        self.new(
            #r.css("h2.body-text__paragraph-header.font--h2"),
            #r.css("strong a href").text,
            #.css("em").text,
            #r.css("p.body-text__paragraph-text.font--body.has-spacing").text
        )
    end

    def initialize(name, url)
        @name, @url = name, url
        @name, @city, @description = nil, nil, nil
        @@all << self
    end

    def self.all
        @@all
    end
end