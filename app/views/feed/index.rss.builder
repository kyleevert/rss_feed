xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "RSS Feed Combined"
    xml.description "This is a combined rss feed."
    xml.link root_url

    @reddit_links.each do |link|
      xml.item do
        # xml.title article.title
        # xml.description article.body
        # xml.pubDate article.published_at.to_s(:rfc822)
        # xml.link article_url(article)
        # xml.guid article_url(article)
        xml.link link
      end
    end
  end
end