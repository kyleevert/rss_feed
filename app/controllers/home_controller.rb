require 'open-uri'

class HomeController < ApplicationController
  def index
    url = 'https://www.reddit.com/r/Bitcoin/top.rss?sort=top&t=day.rss'
    @xml_doc = Nokogiri::XML(open(url))
  end
end