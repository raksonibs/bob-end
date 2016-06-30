class Match < ApplicationRecord
  # belongs_to_and_has_many :user
  belongs_to :game
  has_many :wagers
  has_many :played_games

  def total_amount
    wagers.inject(&:+)
  end
end
