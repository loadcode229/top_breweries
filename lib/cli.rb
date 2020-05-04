class TopBreweries::CLI
    
    def call
        make_breweries
        introduction
        start
    end

    def introduction
        puts ""
        puts "Welcome to the Top Breweries in each State!"
        sleep(2)
        puts ""
    end

    def start
        puts ""
        puts "What number breweries would you like to see? 1-10, 11-20, 21-30, 31-40, or 41-50?"
        input = choose_range

        display_breweries(input)

        puts ""
        puts "What brewery would you like more information on?"
        input = gets.strip

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

    def make_breweries
        breweries_arr = TopBreweries::Scraper.get_brewery_info
        TopBreweries::Breweries.create_from_collection(breweries_arr)
    end

    def display_brewery(brewery)
        puts ""
        puts "---------- #{brewery.b_name} ----------"
        puts ""
        puts "Location: #{brewery.city}, #{brewery.state}"
        puts "Website: #{brewery.b_links}"
        puts ""
        puts "---------- Description ----------"
        puts ""
        puts "#{brewery.description}"
        puts ""
    end

    def display_breweries(from_num)
        puts ""
        puts "---------- Breweries #{from_num+1} - #{from_num+10} ----------"
        puts ""
        TopBreweries::Breweries.all[from_num+0,10].each.with_index(from_num+1) do |brewery, index|
            puts "#{index}. #{brewery.b_name}"
        end
    end

    def choose_range
        choices = ["1-10", "11-20", "21-30", "31-40", "41-50"]
        loop do 

            choices.each.with_index do |c, i|
                puts "#{i+1}. #{c}"
            end
            choice = gets.strip
            if choice.to_i.between?(1, choices.length)
                return (choice.to_i - 1) * 10
            end
            puts "That is not a valid choice. Please try again."
        end

    end
end