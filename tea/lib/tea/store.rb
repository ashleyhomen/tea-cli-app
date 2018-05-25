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
      tea = doc.css('div.product-card__info')
        name = tea.css('h3').first.text
        info = tea.css('div.product-card__info-main p').first.text
        type = tea.css('span.product-card__type').first.text
        url = "https://meileaf.com" + tea.css('div.product-card__info-top a').first['href']
      binding.pry  #url_f = tea.css('a.product-card__image-link')['href']

        # tea.css('h3').first.text
  end
end
