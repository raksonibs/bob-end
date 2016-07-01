class Game < ApplicationRecord
  belongs_to :game_type
  belongs_to :user
  belongs_to :match, validate: false
  has_many :wagers
end
