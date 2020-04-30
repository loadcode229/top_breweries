class TopBreweries::Breweries

    attr_accessor :state, :b_name, :city, :description, :b_links

    @@all = []

    def initialize(brewery_hash)
        self.send("states=", brewery_hash[:state])
        self.send("b_name=", brewery_hash[:b_name])
        self.send("b_links=", brewery_hash[:b_links])
        self.send("city=", brewery_hash[:city])
        self.send("description=", brewery_hash[:description])
        @@all << self
    end

    def self.create_from_collection(breweries_arr)
        breweries_arr.each do |brewery_hash| #each brewery is a hash
            TopBreweries::Breweries.new(brewery_hash)
        end
    end
    
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    
end