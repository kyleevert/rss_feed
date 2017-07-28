xml.instruct! :xml, :version => "1.0"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.category term: "Bitcoin", label: "r/Bitcoin"
  xml.id "/feed-test.rss"
  xml.link rel: "self", href: "https://cardano-rss-feed.herokuapp.com/feed-test.rss", type: "application/atom+xml"
  xml.link rel: "alternate", href: "https://cardano-rss-feed.herokuapp.com/feed-test.rss", type: "text/html"
  xml.subtitle "A community dedicated to Bitcoin, *the currency of the Internet*. Bitcoin is a distributed, worldwide, decentralized digital money. Bitcoins are issued and managed without any central authority whatsoever: there is no government, company, or bank in charge of Bitcoin. You might be interested in Bitcoin if you like cryptography, distributed peer-to-peer systems, or economics. A large percentage of Bitcoin enthusiasts are libertarians, though people of all political philosophies are welcome."
  xml.title "top scoring links : Bitcoin"
  xml.description "This is a combined rss feed."

  @reddit_entries.each do |entry|
    xml.entry do
      # xml.content "<table>#{link}</table>", type: "html"
      xml.category term: "Bitcoin", label: "r/Bitcoin"
      xml.content entry.children[2].text, type: "html"
      xml.id entry.children[3].text
    end
  end
end