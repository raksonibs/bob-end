class ConnectFour < ApplicationRecord
  has_many :games
  belongs_to :game_type
end
