xml.instruct! :xml, :version => "1.0"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.title "RSS Feed Combined"
  xml.description "This is a combined rss feed."
  xml.link root_url

  @reddit_links.each do |link|
    xml.entry do
      xml.content link, type: "html"
    end
  end
end