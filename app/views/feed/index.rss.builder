xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Your Blog Title"
    xml.description "A blog about software and chocolate"
    
    for entry in @google_entries
      xml.item do
        xml.title CGI.unescapeHTML(entry.children[3].text), type: "html"
        xml.description CGI.unescapeHTML(entry.children[11].text), type: "html"
        xml.pubDate DateTime.current.to_s(:rfc822)
        xml.link Feed.get_google_link(entry), href: Feed.get_google_link(entry)
        xml.guid entry.children[1].text
      end
    end
  end
end