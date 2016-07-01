class Match < ApplicationRecord  
  has_many :games
  has_many :outcomes
  belongs_to :game_type

  def total_amount
    games.map(&:wagers).flatten.map(&:amount).inject(&:+)
  end
end
