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
        url = "https://meileaf.com#{tea.css('div.product-card__info-top a').first['href']}"
        Teas.new(type, name, info, url)
      end
  end

  def self.srape_tea_profile
    #path = object.url
    i = []
    doc = Nokogiri::HTML(open('https://meileaf.com/tea/25-year-tgy/'))
    notes = doc.css('div.product-tasting-notes dl').text.split('.')
    doc.css('td.brewing-instructions__td').each {|item| instructions << item.text.split(" ").join(" | ")}
    water_temp = i[0]
    gongfu_intructions = {:grams_per_100ml_water => i[1], :first_infusion => i[2], :additional_infusions => i[3], :total_infusions =>[4]}
    western_intructions = {:grams_per_100ml_water => i[5], :first_infusion => i[6], :additional_infusions => i[7], :total_infusions =>[8]}
    binding.pry
  end
end
