class InputFeedsController < ApplicationController

  before_action :set_input_feed, only: [:edit, :update, :destroy]
  def index
    @google_feeds = InputFeed.google
    @reddit_feeds = InputFeed.reddit
  end

  def new
    @input_feed = InputFeed.new
  end

  def create
  end

  def edit
  end

  def update
    if @robot.update_attributes(input_feed_params)
      redirect_to :action => 'show', :id => @robot.id
    end
  end

  def destroy
  end

  private

  def set_input_feed
    @input_feed = InputFeed.find(params[:id])
  end

  def input_feed_params
    params.require(:input_feed).permit(:name, :url, :feed_type)
  end
end
