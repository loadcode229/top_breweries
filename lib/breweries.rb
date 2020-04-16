

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

    def add_student_attributes(attributes_hash)
        self.send("twitter=", attributes_hash[:twitter])
        self.send("instagram=", attributes_hash[:instagram])
        self.send("facebook=", attributes_hash[:facebook])
    end

    def self.all
        @@all
    end
end