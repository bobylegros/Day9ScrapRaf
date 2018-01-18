
# require_relative 'vauréal'
require 'rubygems'
require 'nokogiri'
require 'open-uri'




def get_the_email_of_a_townhall_from_its_webpage
    page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))
    mail = page.css('td p font')
    mail.each do |mail|
    if mail.text.include?('@')
        puts mail.text
    end
    end
end
get_the_email_of_a_townhall_from_its_webpage



# def get_all_the_urls_of_val_doise_townhalls
#     page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
#     mail = page.css('td p font')
#     mail.each do |mail|
#     if mail.text.include?('@')
#         puts mail.text
#     end
#     end
# end



def get_townhall_name
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  townhalls = page.css('tr td p a')
  townhalls.each do |townhall|
        puts townhall.text
  end
end
get_townhall_name



# def get_townhall_url
#   page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
#   townhalls = page.css('tr td p a')['href']
#   townhalls.each do |townhall|
#         puts townhall.text
#   end
# end
# get_townhall_url
#
# # page.css('a')[1]['href']
