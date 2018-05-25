class Importer

  def self.get_url(input)
    if input == "green"
      "https://meileaf.com/teas/green"
    elsif input == "black"
      "https://meileaf.com/teas/black"
    elsif input == "oolong"
      "https://meileaf.com/teas/oolong"
    elsif input == "yellow"
      "https://meileaf.com/teas/yellow"
    elsif input == "white"
      "https://meileaf.com/teas/white"
    elsif input == "puerh"
      "https://meileaf.com/teas/ripened"
    elsif input == "china"
      "https://meileaf.com/teas/china"
    elsif input == "japan"
      "https://meileaf.com/teas/japan"
    elsif input == "taiwan"
      "https://meileaf.com/teas/taiwan"
    else input == "all"
      "https://meileaf.com/teas"
    end
  end

  def self.scrape_teas(input)
    path = get_url(input)
      puts "Here's a list of the teas you asked for."
      doc = Nokogiri::HTML(open(url))
      doc.css('div.product-card__info').each do |tea|
        name = tea.css('h3').text
        info = tea.css('div.product-card__info-main p').text
        type = tea.css('span.product-card__type').text
        url = "https://meileaf.com#{tea.css('div.product-card__info-top a').first['href']}"
        new_tea = Teas.new(type, name, info, url)
        self.scrape_tea_profile(new_tea)
      end
  end

  def self.scrape_tea_profile(new_tea)
    puts new_tea
    path = new_tea.url
    i = []
    doc = Nokogiri::HTML(open(path))
    new_tea.notes = doc.css('div.product-tasting-notes dl').text.split('.')
    doc.css('td.brewing-instructions__td').each {|item| i << item.text.split(" ").join(" | ").gsub("&plus;","+")}
    new_tea.gongfu_instructions = {:water_temp => i[0], :grams_per_100ml_water => i[1], :first_infusion => i[2], :additional_infusions => i[3], :total_infusions => i[4]}
    new_tea.western_instructions = {:water_temp => i[0], :grams_per_100ml_water => i[5], :first_infusion => i[6], :additional_infusions => i[7], :total_infusions => i[8]}
    print_info(new_tea)
  end

  def self.print_info(obj)
    puts "this is the tea info"
    puts "#{obj.name}"
    puts "#{obj.type}"
    puts "#{obj.info}"
    puts "#{obj.url}"
    puts "#{obj.notes}"
    puts "#{obj.gongfu_instructions}"
    puts "#{obj.western_instructions}"
  end
end

#./bin/console
#Importer.scrape_tea_profile

git commit -a -m "updated url in Importer"
git push origin master
ashley3schultz
