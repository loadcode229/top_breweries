class TopBreweries::Scraper

    def self.get_brewery_info
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
        b_arr = []
        brewery_info.map do |p|
            brewery_info_hash = {
            :brewery_links => p.css("a").attr("href").text,
            :brewery_name => p.css("a").first.text,
            :city => p.css("em").first.text,
            :description => p.search('#text')}
        b_arr << brewery_info_hash
        end
        
    end


end



#doc.css("a").attr("href").value
#doc.css("strong")[1..51].text