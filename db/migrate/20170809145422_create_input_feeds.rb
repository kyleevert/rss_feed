class CreateInputFeeds < ActiveRecord::Migration
  def change
    create_table :input_feeds do |t|
      t.string :url
      t.string :feed_type
      t.timestamps null: false
    end
  end
end
