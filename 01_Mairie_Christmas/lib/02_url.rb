def mairie_chrsitmas
require 'nokogiri'
require 'open-uri'
       
page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/herault.html"))

def get_townhall_name
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/herault.html"))
    townhall_name = page.xpath('//a[@class="lientxt"]').map {|x| x.text}

return townhall_name
end


def get_townhall_urls
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/herault.html"))
    
    urls = page.xpath('//a[@class="lientxt"]/@href').map{|x| x.text[1..-1]}
    urls.length.times do |url| 
    urls[url] = "http://annuaire-des-mairies.com" + urls[url]
    end
return urls
end

def perform

a = get_townhall_name.to_a
b = get_townhall_urls.to_a


list = a.zip(b).each_slice(1).map(&:to_h)
puts list
end

perform
end
puts mairie_chrsitmas




