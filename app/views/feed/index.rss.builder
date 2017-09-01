xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.id "cardano-feed.rss"
    xml.title "Cardano RSS Feed"
    xml.description "Cardano RSS Feed urls"

    for entry in @reddit_entries
      xml.item do
        xml.title CGI.unescapeHTML(entry.children[6].text), type: "html"
        xml.description entry.children[2].text, type: "html"
        xml.pubDate entry.children[5].text
        xml.link CGI.unescapeHTML(Feed.get_reddit_link(entry)), href: CGI.unescapeHTML(Feed.get_reddit_link(entry))
        xml.guid entry.children[3].text
      end
    end
    
    for entry in @google_entries
      xml.item do
        xml.title Sanitize.clean CGI.unescapeHTML(entry.children[3].text), type: "html"
        xml.description Sanitize.clean CGI.unescapeHTML(entry.children[11].text), type: "html"
        xml.pubDate entry.children[7].text
        xml.link Feed.get_google_link(entry), href: Feed.get_google_link(entry)
        xml.guid entry.children[1].text
      end
    end
  end
end