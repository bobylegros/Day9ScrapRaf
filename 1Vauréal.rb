require 'rubygems'
require 'nokogiri'
require 'open-uri'


#On cré une fonction qui va permettre d'aller récupérer un URL
def scrapper_for_dummies(url, path)
	page = Nokogiri::HTML(open(url))
	return page.css(path)
end



def get_the_email_of_a_townhall_from_its_webpage(reste_url)
	url = $base_url + reste_url                      #On concatène les variable pour n'avoir plus qu'à préciser le path par la suite
	mail = scrapper_for_dummies(url, "td p font")    #On précise le "path" dans l'URL pour permettre à la variable "mail"
	mail.each do |mail|
	    if mail.text.include?('@')                   #On précise que l'on récupère le fichier texte de la variable "mail" s'il contient un @
	        puts mail.text
	    end
	end
end

#Est une variable dites globale. Le $ permet de l'appeler dans une fonction.
$base_url = "http://annuaire-des-mairies.com/"

#Ici on appel la fonction en précisant la suite de l'URL que l'on veut
get_the_email_of_a_townhall_from_its_webpage("95/vaureal.html")
