require 'open-uri'

class Feed
  FEED_URLS = [
    'https://www.reddit.com/r/Bitcoin/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/CryptoCurrency/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/ethereum/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/EthereumClassic/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/litecoin/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/Ripple/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/dashpay/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/nem/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/Iota/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/Monero/top.rss?sort=top&t=day.rss',
    'https://www.reddit.com/r/stratisplatform/top.rss?sort=top&t=day.rss'
  ]

  def self.feed_links
    feed_links = []
    FEED_URLS.each do |feed_url|
      xml_doc = Nokogiri::XML(open(feed_url, 'User-Agent' => 'Nooby'))
      xml_entries = xml_doc.xpath("//xmlns:entry")

      xml_entries.each do |xml_entry|
        feed_links << xml_entry.children[4].attributes["href"].value
      end
    end
    feed_links
  end
end