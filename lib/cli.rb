class TopBreweries::CLI
    
    def call
        make_breweries
        introduction
        start
    end

    def introduction
        puts "\n\n\n"
        puts "Welcome to the Top Breweries in each State!"
        sleep(2)
        puts "\n\n\n"
    end

    def start
        puts ""
        display_breweries
        puts ""
        puts "What brewery would you like more information on?"
    end

    def make_breweries
        breweries_arr = TopBreweries::Scraper.get_brewery_info
        TopBreweries::Breweries.create_from_collection(breweries_arr)
    end

    def display_brewery(brewery)
        puts ""
        puts "---------- #{brewery.b_name} - #{restaurant.state},#{brewery.city}" 
        puts ""
        puts "---------- Description ----------"
        puts ""
        puts "#{brewery.description}"
        puts ""
        puts "---------- Website ----------"
        puts ""
        puts "#{brewery.b_links}"
        puts ""
    end

    def display_breweries(from_num)
        puts ""
        puts "---------- Breweries #{from_num} - #{from_num+49} ----------"
        puts ""
        TopBreweries::Breweries.all[from_num-1,50].each.with_index(from_num) do |brewery, index|
            puts "#{index}. #{brewery.b_name}"
        end
    end
end