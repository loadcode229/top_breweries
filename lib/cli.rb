

class TopBreweries::CLI

    
    def call
        introduction
        get_brewery_data
        brew_loop
    end

    def introduction
        puts "\n\n\n"
        puts "Welcome to the Top Breweries in each State!"
        sleep(2)
        puts "\n\n\n"
    end

    def get_brewery_data
        TopBreweries::Scraper.get_brewery_info
    end

    def brew_loop
        loop do
            menu
            input = get_brewery_choice
            break if input == "exit"
            next if input == "invalid"
            display_single_brewery(input)
        end
    end

    def start
        puts ""
        puts "What number of r would you like to see? 1-10, 11-20, 21-30, 31-40, 41-50?"
        input = gets.strip.to_i

        print_breweries

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
        puts "---------- Breweries #{from_number} - #{from_number+49} ----------"
        puts ""
        TopBreweries::Breweries.all[from_number-1, 50].each.with_index(from_number) do |brewery, index|
            puts "#{index}. #{brewery.name} - #{brewery.state}"
        end
    end

    def menu
        display_breweries
        display_instructions
    end

    def display_breweries
        TopBreweries::Breweries.all.each.with_index do |p, i|
            puts "#{i+1} #{p}"
        end
    end

    def display_instructions
        puts "Please choose a brewery by number of type 'exit' to exit the program."
    end
end