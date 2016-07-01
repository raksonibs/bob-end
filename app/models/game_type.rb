class GameType < ApplicationRecord
  # 1 -> rock paper scissors
  # 2 -> connect_four
  # 3 -> stix
  # 4 -> tic_tac_toe
  has_many :matches
  has_many :games
end
