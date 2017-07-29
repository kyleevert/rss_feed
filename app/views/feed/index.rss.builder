xml.instruct! :xml, :version => "1.0"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.id "/feed-test.rss"
  xml.title "RSS Feed Combined"
  xml.description "This is a combined rss feed."

  @reddit_entries.each do |entry|
    xml.entry do
      xml.content Feed.get_reddit_link(entry), type: "html"
      xml.id entry.children[3].text
      xml.title entry.children[6].text, type: "html"
    end
  end

  @google_entries.each do |entry|
    xml.entry do
      xml.content Feed.get_google_link(entry), type: "html"
      xml.id entry.children[1].text
      xml.title entry.children[3].text, type: "html"
    end
  end
end