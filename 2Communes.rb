require 'rubygems'
require 'nokogiri'
require 'open-uri'

#On cré une fonction qui va permettre d'aller récupérer un URL
def scrapper_for_dummies(url, path)
	page = Nokogiri::HTML(open(url))
	return page.css(path)
end

def get_the_email_of_a_townhall_from_its_webpage(reste_url)
	url = $base_url + reste_url														#On concatène les variable pour n'avoir plus qu'à préciser le path par la suite
	mail = scrapper_for_dummies(url, "td p font")					#On précise le "path" dans l'URL pour permettre à la variable "mail"
	mail.each do |mail|
	    if mail.text.include?('@')												#On précise que l'on récupère le fichier texte de la variable "mail" s'il contient un @
	        puts mail.text
	    end
	end
end

def get_url_to_town
	url = $base_url + "val-d-oise.html"										#On concatène pour compléter l'URL
	towns = scrapper_for_dummies(url, "a.lientxt")
	# p $base_url + towns[0]['href']											#permet de le tester pour une seule commune
	towns.each do |town|																	#Pour toutes les villes 
    	puts $base_url + town['href']											#On demande d'afficher l'URL
    	get_the_email_of_a_townhall_from_its_webpage(town['href']) #Ici on appel la fonction précédente qui va afficher les email.
    end
end


#$ = variable globale qui permet d'être utilisée dans une fonction
$base_url = "http://annuaire-des-mairies.com/"

#On appel la fonction
get_url_to_town





#TESTS

# get_the_email_of_a_townhall_from_its_webpage("95/vaureal.html")
# get_the_email_of_a_townhall_from_its_webpage("95/survilliers.html")
