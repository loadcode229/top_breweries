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

    def get_brewery_choice
        input = gets.strip.downcase
        return input if input == "exit"
        if !valid?(input)
            puts "That command doesn't make sense."
            return "invalid"
        end
        return input.to_i - 1
    end

    def display_single_brewery(i)
        b = TopBreweries::Breweries.all[i]
        TopBreweries::Scraper.get_brewery_info(b) if !b.full?
        puts b.full_details
        puts "Press any key to continue:"
        gets
    end

    def valid?(i)
        i.to_i.between?(1, TopBreweries::Breweries.all.length)
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
        puts "Please choose a brewery by number or type 'exit' to exit the program."
    end
end