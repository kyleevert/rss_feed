class UpdateNameValueAgainForExistingInputFeeds < ActiveRecord::Migration
  def change
    InputFeed.all.each do |feed|
      if feed.feed_type == 'google'
        feed.update_column :name, feed.url.split('/').last
      else
        splits = feed.url.split('/')
        feed.update_column :name, splits[splits.count - 2]
      end
    end
  end
end
