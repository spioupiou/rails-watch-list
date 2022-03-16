class Movie < ApplicationRecord
  belongs_to :list
  validates :title, :poster_url, presence: true
end
