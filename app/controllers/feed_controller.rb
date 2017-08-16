class FeedController < ApplicationController
  def index
    # feed_urls = params[:reddit_input_rss] || []
    feed_url_ids_str = params[:reddit_input_rss] || ''
    feed_urls = InputFeed.where(id: feed_url_ids_str.split(','), feed_type: 'reddit').pluck(:url)
    @reddit_entries = Feed.reddit_feed_entries feed_urls

    # feed_urls = params[:google_input_rss] || []
    feed_url_ids_str = params[:google_input_rss] || ''
    feed_urls = InputFeed.where(id: feed_url_ids_str.split(','), feed_type: 'google').pluck(:url)
    @google_entries = Feed.google_feed_entries feed_urls
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def feed_test
    @reddit_entries = Feed.reddit_test_feed_entries
    respond_to do |format|
      format.rss { render :layout => false }
      format.atom { render :layout => false }
    end
  end
end