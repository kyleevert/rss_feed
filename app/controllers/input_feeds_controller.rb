class InputFeedsController < ApplicationController

  before_action :set_input_feed, only: [:edit, :show, :update, :destroy]
  def index
    @google_feeds = InputFeed.google
    @reddit_feeds = InputFeed.reddit
  end

  def new
    @input_feed = InputFeed.new
  end

  def create
    @input_feed = InputFeed.new(input_feed_params)
    if @input_feed.save
      redirect_to @input_feed, notice: 'Successfully created the input feed url.'
    else
      redirect_to @input_feed, alert: @input_feed.errors.full_messages.join(',')
    end
  end

  def show
  end

  def edit
  end

  def update
    if @input_feed.update_attributes(input_feed_params)
      redirect_to @input_feed, notice: 'Successfully updated the input feed url.'
    else
      redirect_to @input_feed, alert: @input_feed.errors.full_messages.join(',')
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
