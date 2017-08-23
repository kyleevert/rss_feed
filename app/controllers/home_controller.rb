require 'open-uri'

class HomeController < ApplicationController
  # before_action :authenticate_user!
  
  def index
  end

  def combine_feed
    reddit_input_rss_feeds = (params[:reddit_input_rss] || []).uniq
    reddit_input_rss_feeds.delete_if {|x| x.blank? }
    google_input_rss_feeds = (params[:google_input_rss] || []).uniq
    google_input_rss_feeds.delete_if {|x| x.blank? }
    @feed_url = feed_url(format: :rss, reddit_input_rss: reddit_input_rss_feeds.join(','), google_input_rss: google_input_rss_feeds.join(','))
    respond_to do |format|
      format.js {
        render :combine_feed
      }
    end
  end
end