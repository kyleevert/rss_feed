require 'open-uri'

class HomeController < ApplicationController
  def index
    @reddit_links = Feed.reddit_feed_links
    # @google_feed_links = Feed.google_alert_feed_links
  end
end