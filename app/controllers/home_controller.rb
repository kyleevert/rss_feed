require 'open-uri'

class HomeController < ApplicationController
  def index
    # @reddit_links = Feed.reddit_feed_links
    # @google_feed_links = Feed.google_alert_feed_links
  end

  def combine_feed
    input_rss_feeds = params[:input_rss]
    input_rss_feeds.delete_if {|x| x.blank? }
    @feed_url = feed_url(format: :rss, input_rss: input_rss_feeds)
    respond_to do |format|
      format.js {
        render :combine_feed
      }
    end
  end
end