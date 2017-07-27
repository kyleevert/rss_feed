require 'open-uri'

class HomeController < ApplicationController
  def index
    url = 'https://www.reddit.com/r/CryptoCurrency/top.rss?sort=top&t=day.rss'
    xml_doc = Nokogiri::XML(open(url, 'User-Agent' => 'Nooby'))
    xml_entries = xml_doc.xpath("//xmlns:entry")
    @links = []
    xml_entries.each do |xml_entry|
      @links << xml_entry.children[4].attributes["href"].value
    end

    # @links = Feed.feed_links
  end
end