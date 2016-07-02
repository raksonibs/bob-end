class Match < ApplicationRecord  
  has_many :games, validate: false
  has_many :outcomes
  belongs_to :game_type
  # has_many :wagers, validate: false
  after_create :set_match_amount

  def set_match_amount
    update_attributes(match_amount: games.map(&:wagers).flatten.map(&:amount).inject(&:+))
  end

  def total_amount
    games.map(&:wagers).flatten.map(&:amount).inject(&:+)
  end
end
