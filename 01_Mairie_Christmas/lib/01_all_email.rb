
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


def get_townhall_email(random)
    page = Nokogiri::HTML(URI.open(random))
    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    return email
end

def merge
urls = get_townhall_urls
emails = urls.map{|z| get_townhall_email(z)}
end

def assemble
    townhall_name = get_townhall_name
    emails = merge
    hash = townhall_name.zip(emails).each_slice(1).map(&:to_h)
    puts hash
end

assemble
