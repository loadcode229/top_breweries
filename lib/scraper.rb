require 'pry'
class TopBreweries::Scraper

    def get_brewery_info
        parsed_page = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-best-craft-brewery-in-every-state-in-america/"))
        doc = parsed_page.css("p.body-text__paragraph-text.font--body.has-spacing")
        breweries_arr = []
        doc.each do |brewery|
            brewery_hash = {
                :brewery_url => brewery.css("a").attr("href"),
                :brewery_name => brewery.css("strong")[1..51]
            }
            breweries_arr << brewery_hash
        end
        breweries_arr
        binding.pry
    end

    #def make_breweries
        #get_brewery_info.each do |r|
            #TopBreweries::Breweries.new_from_index_page(r)
        #end
    #end

end


#doc.css("a").attr("href").value
#doc.css("strong")[1..51].text