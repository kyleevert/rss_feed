xml.instruct! :xml, :version => "1.0"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.title "RSS Feed Combined"
  xml.description "This is a combined rss feed."
  xml.link "https://cardano-rss-feed.herokuapp.com/feed-test.rss", rel: "self", href: "https://cardano-rss-feed.herokuapp.com/feed-test.rss", type: "application/atom+xml"
  xml.link "https://cardano-rss-feed.herokuapp.com/feed-test.rss", rel: "alternate", href: "https://cardano-rss-feed.herokuapp.com/feed-test.rss", type: "text/html"

  @reddit_links.each do |link|
    xml.entry do
      # xml.content "<table>#{link}</table>", type: "html"
      xml.content link, type: "html"
    end
  end
end