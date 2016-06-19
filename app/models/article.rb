class Article < ApplicationRecord
  has_many :favourites
  belongs_to :location
end
