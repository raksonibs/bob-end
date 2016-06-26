class PlayedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game, foreign_key: :game_id
end
