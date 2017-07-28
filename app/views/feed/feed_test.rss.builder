xml.instruct! :xml, :version => "1.0"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  # xml.category term: "Bitcoin", label: "r/Bitcoin"
  xml.id "/feed-test.rss"
  # xml.link rel: "self", href: "https://cardano-rss-feed.herokuapp.com/feed-test.rss", type: "application/atom+xml"
  # xml.link rel: "alternate", href: "https://cardano-rss-feed.herokuapp.com/feed-test.rss", type: "text/html"
  xml.title "RSS Feed Combined"
  xml.description "This is a combined rss feed."

  @reddit_entries.each do |entry|
    xml.entry do
      xml.content Feed.get_only_link(entry), type: "html"
      # xml.content '<a href="https://www.reddit.com/r/Bitcoin/comments/6pwd4k/share_some_of_the_most_importance_advice_youve/">[link]</a>', type: "html"
      xml.id entry.children[3].text
      xml.title entry.children[6].text
    end
  end
end