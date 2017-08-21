class UpdateNameValueForExistingInputFeeds < ActiveRecord::Migration
  def change
    InputFeed.all.each do |feed|
      feed.update_column :name, feed.url.split('/').last
    end
  end
end
