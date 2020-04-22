class TopBreweries::Breweries
    attr_accessor :state, :name, :city, :description

    @@all = []

    def self.new_from_index_page(r)
        self.new(
            r.css("h2.body-text__paragraph-header.font--h2"),
            r.css("strong a href").text,
            r.css("em").text,
            r.css("p.body-text__paragraph-text.font--body.has-spacing").text
        )
    end

    def initialize(state=nil, name=nil, city=nil, description=nil)
        @state = state
        @name = name
        @city = city
        @description = description
        @@all << self
    end

    def doc
        doc ||= Nokogiri::HTML(open(self.url))
    end

    def self.all
        @@all
    end
end