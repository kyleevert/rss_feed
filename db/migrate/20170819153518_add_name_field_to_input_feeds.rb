class AddNameFieldToInputFeeds < ActiveRecord::Migration
  def change
    add_column :input_feeds, :name, :string
  end
end
