class TopBreweries::Scraper

    def self.get_brewery_info
        html = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-america/"))
        breweries = []
        states = html.css('h2').map(&:text)
        parsed_page = html.css("h2+p")
        #Zipper pattern is BAD
        parsed_page.each.with_index do |brewery, i|
            b_links = brewery.css("a").attr("href").text
            b_name = brewery.css("a").first.text
            cityem = brewery.css("em:nth-child(3)").first
            
            description_unaltered = brewery.text.split("--").first
            city =  cityem ? cityem.text : find_state(description_unaltered)
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

    def self.find_state(des)
        
        #text_area = des.split("\n")[-2]
        #if !text_area
        des.gsub(/([^\sA-Z])([A-Z])/, '\1'+"\n"+'\2').split("\n")[1]

        #text_area.gsub(/(.*)([A-Z])/, '\2')
    end
end
    


#doc.css("a").attr("href").value
#doc.css("strong")[1..51].text