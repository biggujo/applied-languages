require 'nokogiri'
require 'open-uri'

WEBSITE = "https://www.hospitalsafetygrade.org/all-hospitals"

hospitals_document = Nokogiri::HTML(URI.open(WEBSITE))

hospitals_document.css('#BlinkDBContent_849210 > ul > li > a').each do |link|
  puts link.content
end