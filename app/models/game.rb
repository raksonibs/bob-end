class Game < ApplicationRecord
  belongs_to :game_type
  belongs_to :user
  belongs_to :match
  has_many :wagers
end
