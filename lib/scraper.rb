class TopBreweries::Scraper

    def get_brewery_info
        parsed_page = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-america/"))
        # doc = parsed_page.css("p")
        # breweries_arr = []
        # doc.each do |brewery|
        #     brewery_hash = {
        #         :brewery_url => brewery.css("a").attr("href").to_s,
        #         :brewery_name => brewery.css("strong").text}
        # breweries_arr << brewery_hash
        # end
        # breweries_arr

        states = parsed_page.css("h2")
        brewery_info = parsed_page.css("h2+p")
        brewery_info_hash = brewery_info.map do |p|
            links = p.css("a").attr("href")
        end
        binding.pry
    end


end



#doc.css("a").attr("href").value
#doc.css("strong")[1..51].text