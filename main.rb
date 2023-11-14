require 'nokogiri'
require 'open-uri'
require 'csv'

def parse_hospitals(output_file_name)
  url = "https://www.hospitalsafetygrade.org/all-hospitals"

  website_page = URI.open(url)
  document = Nokogiri::HTML(website_page)

  hospital_names = document.css('#BlinkDBContent_849210 > ul > li > a')

  if hospital_names.length == 0
    print "No hospital names has been found"
  end

  CSV.open(output_file_name, "w") do |csv|
    hospital_names.each_with_index do |link, index|
      csv << [index + 1, link]
    end
  end
end

begin
  parse_hospitals("hospitals.csv")
rescue SocketError => error
  puts error.message
end