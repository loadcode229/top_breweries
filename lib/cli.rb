class TopBreweries::CLI
    
    def call
        TopBreweries::Scraper.new.make_breweries
        puts "Welcome to the Top Breweries in each State!"
        start
    end

    def start
        puts ""
        puts "What number breweries would you like to see? 1-10, 11-20, 21-30, 31-40, or 41-50?"
        input = gets.strip.to_i

        display_breweries(input)

        puts ""
        puts "What brewery would you like more information on?"
        input = gets.strip.to_i

        brewery = TopBreweries::Breweries.find(input.to_i)

        display_brewery(brewery)

        puts ""
        puts "Would you like to see another brewery? Enter Y or N"

        input = gets.strip.downcase
        if input == "y"
            start
        elsif input == "n"
            puts ""
            puts "Thank you! Have an awesome day!"
            exit
        else
            puts ""
            puts "I don't understand that answer."
            start
        end
    end

    def display_brewery(brewery)
        puts ""
        puts "---------- #{brewery.b_name} ----------" 
        puts ""
        puts "Locatation: #{brewery.state},#{brewery.city}"
        puts "Website: #{brewery.b_links}"
        puts ""
        puts "---------- Description ----------"
        puts ""
        puts "#{brewery.description}"
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