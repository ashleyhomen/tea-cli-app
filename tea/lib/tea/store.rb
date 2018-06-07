class Tea::Importer

  def self.scrape_teas
      doc = Nokogiri::HTML(open('https://meileaf.com/teas/'))
      doc.css('div.product-card__info').each do |tea|
        new_tea = Tea::Teas.new
        new_tea.name = tea.css('h2 span').text
        new_tea.aka = tea.css('h3').text
        new_tea.info = tea.css('div.product-card__info-main p').text
        new_tea.type = tea.css('span.product-card__type').text
        new_tea.url = "https://meileaf.com#{tea.css('div.product-card__info-top a').first['href']}"
      end
  end

  def self.scrape_tea_profile(obj)
    path = obj.url
    i = []
    doc = Nokogiri::HTML(open(path))
    obj.notes = doc.css('div.product-tasting-notes dl').text.gsub("    ","").gsub("  ","").split('.').delete_if(&:empty?)
    obj.origin = doc.css('span.squiggle').text.gsub("    ","").gsub("  ","").split(/\n/).delete_if(&:empty?)[2]
    doc.css('td.brewing-instructions__td').each {|item| i << item.text.split(" ").join(" | ").gsub("&plus;","+")}
    obj.gongfu_instructions = {:water_temp => i[0], :grams_per_100ml_water => i[1], :first_infusion => i[2], :additional_infusions => i[3], :total_infusions => i[4]}
    obj.western_instructions = {:water_temp => i[0], :grams_per_100ml_water => i[5], :first_infusion => i[6], :additional_infusions => i[7], :total_infusions => i[8]}
  end
end
