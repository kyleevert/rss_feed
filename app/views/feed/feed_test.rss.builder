xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.id "cardano-feed.rss"
    xml.title "Cardano RSS Feed"
    xml.description "Cardano RSS Feed urls"

    xml.item do
      xml.title Sanitize.clean(CGI.unescapeHTML("&lt;b&gt;Bitcoin&lt;/b&gt; - The New Hedging Tool")), type: "html"
      xml.description Sanitize.clean CGI.unescapeHTML("Recent events shows that investors are increasingly using &lt;b&gt;Bitcoin&lt;/b&gt; as a hedging tool against geo-politics and market uncertainties. In the next 10 years,&amp;nbsp;..."), type: "html"
      xml.pubDate DateTime.current.to_s
      xml.link "https://seekingalpha.com/article/4103589-bitcoin-new-hedging-tool", href: "https://seekingalpha.com/article/4103589-bitcoin-new-hedging-tool"
      xml.guid 'abdfsdf'
    end
  end
end