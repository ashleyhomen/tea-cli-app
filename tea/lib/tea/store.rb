class Importer

  def self.get_url(type)
    if type == "green"
      "http://teapedia.org/en/Green_tea"
    elsif type == "black"
      "http://teapedia.org/en/Black_tea"
    elsif type == "oolong"
      "http://teapedia.org/en/Oolong_tea"
    elsif type == "yellow"
      "http://teapedia.org/en/Yellow_tea"
    elsif type == "white"
      "http://teapedia.org/en/White_tea"
    elsif type == "puerh"
      "http://teapedia.org/en/Puerh_tea"
    else
      "http://teapedia.org/en/"
    end
  end

  def self.scrape_teas
      puts "Here's a list of the teas you asked for."
      doc = Nokogiri::HTML(open("https://meileaf.com/teas"))
      doc.css('div.product-card__info').each do |tea|
        name = tea.css('h3').text
        info = tea.css('div.product-card__info-main p').text
        type = tea.css('span.product-card__type').text
        url = "https://meileaf.com#{tea.css('div.product-card__info-top a')['href']}"
        Tea.new(type, name, info, url)
          binding.pry
      end

  end
end
