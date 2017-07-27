require 'open-uri'

class HomeController < ApplicationController
  def index
    url = 'https://www.reddit.com/r/Bitcoin/top.rss?sort=top&t=day.rss'
    xml_doc = Nokogiri::XML(open(url, 'User-Agent' => 'Nooby'))
    xml_contents = xml_doc.xpath("//xmlns:content")
    xml_contents.each do |aml_content|
      
    end
    binding.pry
  end
end