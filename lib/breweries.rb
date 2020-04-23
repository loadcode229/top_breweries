class TopBreweries::Breweries


    attr_accessor :states, :brewery_name, :city, :description, :brewery_links

    @@all = []

    def initialize(brewery_hash)
        self.send("brewery_name=", brewery_hash[:brewery_name])
        self.send("brewery_links=", brewery_hash[:brewery_links])
        self.send("city=", brewery_hash[:city])
        self.send("states=", brewery_hash[:states])
        self.send("description=", brewery_hash[:description])
        @@all << self
    end

    def self.create_from_collection(brewery_arr)
        brewery_arr.each do |brewery_hash| #each brewery is a hash
            TopBreweries::Breweries.new(brewery_hash)
        end
    end
    
    
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def full_details
        <<-DESC
---------- Brewery Name: #{name} ----------
------ State: #{state} City: #{city} ------
------------- #{description} --------------
        DESC
    end

    
end