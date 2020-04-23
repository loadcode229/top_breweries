class TopBreweries::Scraper

    def self.get_brewery_info
        html = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-america/"))
        breweries = []
        parsed_page = html.css("h2+p")
        parsed_page.each do |brewery|
            state = html.css("h2").first.text
            b_links = parsed_page.css("a").attr("href").text
            b_name = parsed_page.css("a").first.text
            city = parsed_page.css("em").first.text
            description = parsed_page.css("p").first.text.split("\n").pop
            b_info = {:state => state,
                    :b_links => b_links,
                    :b_name => b_name,
                    :city => city,
                    :description => description}
            breweries << b_info
        end
        breweries
        binding.pry
    end
end
    


#doc.css("a").attr("href").value
#doc.css("strong")[1..51].text