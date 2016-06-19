class Article < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites
  belongs_to :location
end
