class GameType < ApplicationRecord
  # 1 -> rock paper scissors
  # 2 -> connect_four
  # 3 -> stix
  # 4 -> tic_tac_toe
  has_many :tic_tac_toes
  has_many :rock_paper_scissors
  has_many :stixes
  has_many :connect_fours
end
