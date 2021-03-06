class List < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :comment, presence: true, length: { minimum: 6 }
  has_many :movies, dependent: :destroy
  # validates_uniqueness_of :movie_id, scope: [:list_id]
  has_one_attached :photo
end
