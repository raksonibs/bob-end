class User < ApplicationRecord
  has_many :favourites
  has_many :articles, through: :favourites
end
