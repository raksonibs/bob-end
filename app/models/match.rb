class Match < ApplicationRecord
  has_many :users
  belongs_to :game
  has_many :wagers
  has_many :played_games
end
