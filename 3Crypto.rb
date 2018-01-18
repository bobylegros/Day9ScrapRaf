# id="currencies-all_wrapper"

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrapper_for_dummies(url, path)
	page = Nokogiri::HTML(open(url))
	return page.css(path)
end



def get_cryptos
	url = $base_url + "all/views/all/"
	coins = scrapper_for_dummies(url, ".table-responsive table > tbody > tr")		#On inclu dans la variable "coins" l'URL du site ansi que le "path" (ou chemin dans le HTML) pour accéder aux données.
	# p coins[0].children[3].text								#
	# p coins[0].children[5].text								#Permet de tester dans quelle index sont les données. Car il y avait des index avec des espaces ou vides
	# p coins[0].children[9].text								#

	coins.each do |coin|																					#
    	puts "#{coin.children[5].text} #{coin.children[9].text}"  #On affiche pour chaque ligne du array, le "text" compris dans l'index 5 et 9.
    end
end

#$ = variable globale qui permet d'être utilisée dans une fonction
$base_url = "https://coinmarketcap.com/"

p get_cryptos






#TESTS
# get_url_to_town
# get_the_email_of_a_townhall_from_its_webpage("95/vaureal.html")
# get_the_email_of_a_townhall_from_its_webpage("95/survilliers.html")
