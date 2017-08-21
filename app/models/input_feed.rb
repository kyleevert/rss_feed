class InputFeed < ActiveRecord::Base
  validates :url, presence: true
  validates :url, uniqueness: true
  validates :feed_type, presence: true

  validates :name, presence: true
  validates :name, uniqueness: true

  scope :reddit, -> { where(feed_type: 'reddit') }
  scope :google, -> { where(feed_type: 'google') }
end
