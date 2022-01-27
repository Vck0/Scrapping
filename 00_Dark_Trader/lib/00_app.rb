def cryptoandvalues
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))


cryptos = Array.new
values = Array.new


page.xpath('/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[3]/div').each do |x|
    cryptos <<x.text
    end

page.xpath('/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[4]/p/span[2]').each do |y|
    values << y.text
    end


hash = Hash[cryptos.zip(values)]
end
puts cryptoandvalues

#Insertion de methodes pour faire les tests 
def hash_count
    return cryptoandvalues.length
end

def hash_check
cryptoandvalues.has_key?("BTC" && Float && !nil)
cryptoandvalues.has_key?("DOT" && Float && !nil)
cryptoandvalues.has_key?("UST" && Float && !nil)
cryptoandvalues.has_key?("ETH")
end


