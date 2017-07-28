xml.instruct! :xml, :version => "1.0"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  # xml.category term: "Bitcoin", label: "r/Bitcoin"
  xml.id "/feed-test.rss"
  # xml.link rel: "self", href: "https://cardano-rss-feed.herokuapp.com/feed-test.rss", type: "application/atom+xml"
  # xml.link rel: "alternate", href: "https://cardano-rss-feed.herokuapp.com/feed-test.rss", type: "text/html"
  xml.title "top scoring links : Bitcoin"
  xml.description "This is a combined rss feed."

  @reddit_entries.each do |entry|
    xml.entry do
      xml.content entry.children[2].text, type: "html"
    end
  end
end