class TopBreweries::Scraper

    def self.get_brewery_info
        html = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-america/")) #opens url and reads all HTML
        breweries = []  #empty breweries array
        states = html.css('h2').map(&:text) #variable states gets all 'h2' selectors in 'html' and gets all text within.
        parsed_page = html.css("h2+p")  #parsed_page gets all within 'h2 and p' selectors
        #Zipper pattern is BAD however..
        parsed_page.each.with_index do |brewery, i|   #takes parsed_page & iterates through each element(brewery) within an index(i).
            b_links = brewery.css("a").attr("href").text
            b_name = brewery.css("a").first.text
            cityem = brewery.css("em:nth-child(3)").first
            description_unaltered = brewery.text.split('--')[0...-1].join("--")
            city =  cityem ? cityem.text : find_city(description_unaltered)
            description = description_unaltered.split("\n").last
            b_info = {:state => states[i],
                    :b_links => b_links,
                    :b_name => b_name,
                    :city => city,
                    :description => description}
            breweries << b_info
        end
        breweries
    end

    def self.find_city(des)
        des.gsub(/([^\sA-Z])([A-Z])/, '\1'+"\n"+'\2').split("\n")[1]
    end
end