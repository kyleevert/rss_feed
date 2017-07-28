class FeedController < ApplicationController
  def index
    @reddit_links = Feed.reddit_feed_links
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def feed_test
    @reddit_links = Feed.reddit_feed_links
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end