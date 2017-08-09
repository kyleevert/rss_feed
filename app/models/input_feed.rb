class InputFeed < ActiveRecord::Base
  validates :url, presence: true
  validates :url, uniqueness: true
  validates :feed_type, presence: true
end
