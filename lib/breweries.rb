class TopBreweries::Breweries


    attr_accessor :state, :b_name, :city, :description, :b_links

    @@all = []

    def initialize(b_name, b_links)
        @b_name, @b_links = b_name, b_links
        @state, @city, @description = nil, nil, nil
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