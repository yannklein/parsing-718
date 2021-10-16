require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from http://www.epicurious.com

url = "http://www.epicurious.com"

html_file = URI.open(url).read

html_doc = Nokogiri::HTML(html_file)

html_doc.search(".article-featured-item").each do |article|
  # p article
  title =  article.search(".hed").text
  link =  article.search(".view-complete-item").attribute("href").value
  puts "#{title}: #{url}#{link}"
end