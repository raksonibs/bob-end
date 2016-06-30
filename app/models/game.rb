class Game < ApplicationRecord
  has_many :played_games
  belongs_to :rock_paper_scissor
  belongs_to :tic_tac_toe
  belongs_to :stix
  belongs_to :connect_four
end
