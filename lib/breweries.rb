class TopBreweries::Breweries

    attr_accessor :state, :b_name, :b_links, :city, :description

    @@all = []

    def initialize(brewery_hash)
        @state = brewery_hash[:state]
        @b_name = brewery_hash[:b_name]
        @b_links = brewery_hash[:b_links]
        @city = brewery_hash[:city]
        @description = brewery_hash[:description]
        @@all << self
    end

    def self.create_from_collection(breweries_arr)
        breweries_arr.map do |brewery_hash| #each brewery is a hash
            TopBreweries::Breweries.new(brewery_hash)
        end
    end

    def self.find(id)
        self.all[id-1]
    end
    
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    
end