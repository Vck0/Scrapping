
    require 'nokogiri'
    require 'open-uri'
       
    
    
    
    puts "Salut BG, Tu veux-tu bien m'indiquer un URL que je te donne un mail, tabarnak? "
    print ">"

    townhall_url =gets.chomp.to_s

    def get_townhall_email(townhall_url)
        page = Nokogiri::HTML(URI.open(townhall_url))
        puts page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    end

    get_townhall_email(townhall_url)

    
    