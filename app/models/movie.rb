class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, :poster_url, presence: true
end
