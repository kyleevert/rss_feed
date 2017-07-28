class FeedController < ApplicationController
  def index
    feed_urls = params[:input_rss] || []
    @reddit_entries = Feed.reddit_feed_entries feed_urls
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def feed_test
    @reddit_entries = Feed.reddit_test_feed_entries
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end