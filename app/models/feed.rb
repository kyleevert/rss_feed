require 'open-uri'
require 'httparty'

class Feed
  FEED_URLS = [
    'https://www.reddit.com/r/Bitcoin/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/CryptoCurrency/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/ethereum/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/EthereumClassic/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/litecoin/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/Ripple/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/dashpay/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/nem/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/Iota/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/Monero/top.rss?sort=top&t=day.rss',
    # 'https://www.reddit.com/r/stratisplatform/top.rss?sort=top&t=day.rss'
  ]

  GOOGLE_FEED_URLS = [
    'https://www.google.co.uk/alerts/feeds/08496812215877632442/3089297706991962376'
  ]

  def self.reddit_feed_entries(feed_urls)
    entries = []
    feed_urls.each do |feed_url|
      xml_doc = Nokogiri::XML(open(feed_url, 'User-Agent' => 'Nooby'))
      xml_entries = xml_doc.xpath("//xmlns:entry")
      entries.concat xml_entries
    end
    entries
  end

  def self.reddit_test_feed_entries
    feed_links = []
    entries = []
    ['https://www.reddit.com/r/Bitcoin/top.rss?sort=top&t=day.rss'].each do |feed_url|
      xml_doc = Nokogiri::XML(open(feed_url, 'User-Agent' => 'Nooby'))
      xml_entries = xml_doc.xpath("//xmlns:entry")

      xml_entries.each do |xml_entry|
        # feed_links << xml_entry.children[2].text

        feed_text = xml_entry.children[2].text
        pos_link = feed_text.index('[link]')
        pos_href = feed_text.rindex('<a href=', pos_link)
        # feed_links << feed_text[pos_href..pos_link + 5]

        feed_links << feed_text
      end
      entries.concat xml_entries
    end
    entries
  end

  def self.google_alert_feed_links
    feed_links = []
    GOOGLE_FEED_URLS.each do |feed_url|
      xml_doc = Nokogiri::XML(open(feed_url, 'User-Agent' => 'Nooby'))
      xml_entries = xml_doc.xpath("//xmlns:entry")
      
      xml_entries.each do |xml_entry|
        uri = URI(xml_entry.children[5].attributes["href"].value)
        url_link = uri.query.split('&').select {|m| m.starts_with?('url')}[0]
        feed_links << url_link.gsub('url=', '')
      end
    end
    feed_links
  end

  def self.simple_rss_feed
    feed_url = 'https://www.reddit.com/r/Bitcoin/top.rss?sort=top&t=day.rss'
    xml_doc = Nokogiri::XML(open(feed_url, 'User-Agent' => 'Nooby'))
    xml_entries = xml_doc.xpath("//xmlns:entry")
    feed_text = xml_entries.first.children[2].text
    pos_link = feed_text.index('[link]</a>')
    pos_href = feed_text.rindex('<a href=', pos_link)
    puts feed_text[pos_href..pos_link + 9]
  end

  def self.get_only_link(xml_entry)
    feed_text = xml_entry.children[2].text
    pos_link = feed_text.index('[link]</a>')
    pos_href = feed_text.rindex('<a href=', pos_link)
    feed_text[pos_href..pos_link + 9]
  end
end