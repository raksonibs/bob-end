class Mover < ApplicationRecord
  belongs_to :game_type
  belongs_to :match 
  has_many :moves
end
