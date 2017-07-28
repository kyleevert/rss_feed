xml.instruct! :xml, :version => "1.0"
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.title "RSS Feed Combined"
  xml.description "This is a combined rss feed."
  xml.link root_url

  @reddit_links.each do |link|
    xml.entry do
      # xml.title article.title
      # xml.description article.body
      # xml.pubDate article.published_at.to_s(:rfc822)
      # xml.link article_url(article)
      # xml.guid article_url(article)
      xml.link link
    end
  end
end