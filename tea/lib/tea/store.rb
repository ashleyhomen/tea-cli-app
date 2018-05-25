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
    #url = get_url(type)
    doc = Nokogiri::HTML(open("https://meileaf.com/teas/"))
    binding.pry
    t = doc.css('div.container product-index')
    name = t.css('div.product-card__info-main h3').first.text
    info = doc.css('div.product-card__info-main p').first.text
    info = doc.css('span.product-card__type').first.text
    url = doc.css('a.product-card__image-link').first['href']
  end
end
