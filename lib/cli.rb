

class TopBreweries::CLI

    
    def call
        introduction
        TopBreweries::Scraper.get_brewery_info
        start
    end

    def introduction
        puts "\n\n\n"
        puts "Welcome to the Top Breweries in each State!"
        sleep(3)
        puts "\n\n\n"
    end

    def start
        puts ""
        puts "What number of restaurants would you like to see? 1-10, 11-20, 21-30, 31-40, 41-50?"
        input = gets.strip.to_i

        print_breweries(input)

        puts ""
        puts "What brewery would you like more information on?"
        input = gets.strip

        brewery = TopBreweries::Breweries.find(input.to_i)

        print_brewery(brewery)

        puts ""
        puts "Would you like to see another brewery? Enter Y or N"

        input = gets.strip.downcase
        if input == "y"
            start
        elsif input == "n"
            puts ""
            puts "Thanks! Have an awesome day!"
            exit
        else
            puts ""
            puts "I don't understand that command."
            start
        end
    end

    def print_brewery(brewery)
        puts ""
        puts "-----------  #{brewery.name} -----------"
        puts ""
        puts "State:    #{brewery.state}"
        puts "City:     #{brewery.city}"
        puts "Description #{brewery.description}"
    end

    def print_breweries(from_number)
        puts ""
        puts "---------- Breweries #{from_number} - #{from_number+51} ----------"
        puts ""
        TopBreweries::Breweries.all[from_number-1, 50].each.with_index(from_number) do |brewery, index|
            puts "#{index}. #{brewery.name} - #{brewery.state}"
        end
    end
end