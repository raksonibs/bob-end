class PlayedGame < ApplicationRecord
  belongs_to :user
  belongs_to :played_game
end
